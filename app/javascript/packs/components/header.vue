<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-info">
    <a class="navbar-brand text-light" href="#">Todo Application</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Menu
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <router-link to="/" class="dropdown-item">Top</router-link>
            <router-link to="/about" class="dropdown-item">About</router-link>
            <router-link to="/contact" class="dropdown-item">Contact</router-link>
          </div>
        </li>
      </ul>
    </div>
  </nav>
</template>
