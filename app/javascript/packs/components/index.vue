<template>
  <div class="container">
    <!-- 新規作成部分 -->
    <div class="form-inline mt-3">
      <div class="form-group mx-sm-3 mb-2">
        <input v-model="newTask" class="form-control" placeholder="Add your task!!">
      </div>
      <button v-on:click="createTask" type="submit" class="btn btn-primary mb-2">add</button>
    </div>
    <!-- リスト表示部分 -->
    <div>
      <ul class="list-group">
        <li
          v-for="task in isNotDoneTasks"
          @change="doneTask(task.id)"
          :key="'row_task_' + task.id"
          class="list-group-item"
        >
          <input type="checkbox" v-bind:id="'task_' + task.id" />
          <label v-bind:for="'task_' + task.id">{{ task.name }}</label>
        </li>
      </ul>
    </div>
    <!-- 完了済みタスク表示ボタン -->
    <button class="btn btn-primary mb-2 mt-3" v-on:click="displayFinishedTasks">Display finished tasks</button>
    <!-- 完了済みタスク一覧 -->
    <div id="finished-tasks" class="display_none">
      <ul class="list-group">
        <li
          v-for="task in isDoneTasks"
          :key="'row_task_' + task.id"
          class="list-group-item line-through"
        >
          <input type="checkbox" v-bind:id="'task_' + task.id" checked="checked" />
          <label v-bind:for="'task_' + task.id">{{ task.name }}</label>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        tasks: [],
        newTask: ''
      }
    },

    computed: {
      isDoneTasks () {
        return this.tasks.filter(task => { return task.is_done })
      },

      isNotDoneTasks () {
        return this.tasks.filter(task => { return !task.is_done })
      },
    },

    mounted: function () {
      this.fetchTasks();
    },

    methods: {
      fetchTasks: function () {
        axios.get('/api/tasks').then((response) => {
          for(var i = 0; i < response.data.tasks.length; i++) {
            this.tasks.push(response.data.tasks[i]);
          }
        }, (error) => {
          console.log(error);
        });
      },
      displayFinishedTasks: function() {
        document.querySelector('#finished-tasks').classList.toggle('display_none')
      },
      createTask: function () {
        if (!this.newTask) return;

        axios.post('/api/tasks', { task: { name: this.newTask } }).then((response) => {
          this.tasks.unshift(response.data.task);
          this.newTask = '';
        }, (error) => {
          console.log(error);
        });
      },
      doneTask: function (task_id) {
        axios.put('/api/tasks/' + task_id, { task: { is_done: 1 } }).then((response) => {
          this.moveFinishedTask(task_id);
        }, (error) => {
          console.log(error);
        });
      },
      moveFinishedTask: function(task_id) {
        var el = document.querySelector('#row_task_' + task_id);
        // DOMをクローンしておく
        var el_clone = el.cloneNode(true);
        // 未完了の方を先に非表示にする
        el.classList.add('display_none');
        // もろもろスタイルなどをたして完了済みに追加
        el_clone.getElementsByTagName('input')[0].checked = 'checked';
        el_clone.getElementsByTagName('label')[0].classList.add('line-through');
        var li = document.querySelector('#finished-tasks > ul > li:first-child');
        document.querySelector('#finished-tasks > ul').insertBefore(el_clone, li);
      }
    }
  }
</script>

<style scoped>
  [v-cloak] {
    display: none;
  }
  .display_none {
    display: none;
  }
  .line-through {
    text-decoration: line-through;
  }
</style>
