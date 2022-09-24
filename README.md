<div id="top"></div>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/SaahilParikh/Strawberry">
    <h2>🍓</h2>
  </a>

<h3 align="center">A Tiny Hammerspoon Pomodoro Timer for the Menubar</h3>
<p align="center">Fork of Cherry Tomato</p>

  <p align="center">
    <a href="https://github.com/SaahilParikh/Strawberry"><strong>Explore the docs »</strong></a>
    <br />
    <a href="https://github.com/SaahilParikh/Strawberry">View Demo</a>
    ·
    <a href="https://github.com/SaahilParikh/Strawberry/issues">Report Bug</a>
    ·
    <a href="https://github.com/SaahilParikh/Strawberry/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

Strawberry is a small light weight pomodoro timer written in Lua for Hammerspoon.

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* Lua
* Hammerspoon

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

Install hammerspoon
* hammerspoon
  ```sh
  brew install --cask hammerspoon
  ```

### Installation
0. Make a spoons directory for hammerspoon
   ```sh
   mkdir ~/.hammerspoon/Spoons
   ```
1. Download Strawberry and it's dependencies
   ```sh
   curl -L https://github.com/Hammerspoon/Spoons/raw/master/Spoons/CountDown.spoon.zip > /tmp/CountDown.spoon.zip
   curl -L https://github.com/SaahilParikh/Strawberry/raw/main/Spoon/Strawberry.spoon.zip > /tmp/Strawberry.spoon.zip
   unzip /tmp/CountDown.spoon.zip -d ~/.hammerspoon/Spoons/
   unzip /tmp/Strawberry.spoon.zip -d ~/.hammerspoon/Spoons/
   ```
2. Add use strawberry spoon in your ```init.lua```
   ```sh
   echo 'hs.spoons.use("Strawberry")' >> ~/.hammerspoon/init.lua
   ```
3. Clean up temporary files
   ```sh
   rm /tmp/CountDown.spoon.zip
   rm /tmp/Strawberry.spoon.zip
   ```
   
<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Currently the Strawberry Timer works as a full pomodoro timer. You can use it to start a 25 minute long work session or a 5/15 minute long break. Furthermore, you can let the timer run on a pomodoro loop!

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [X] 25 Minute Long Work Timer
- [X] 5 / 15 Minute Long Break Timer
- [X] Alerts When the Timer Ends
    - [X] Pop up Box During Breaks
    - [X] Option to Work/Break for Five More Minutes After Timer Ends
- [X] Minimal Timer Bar at the Bottom of the Screen
- [X] Pomodoro Loop Logic

See the [open issues](https://github.com/SaahilParikh/Strawberry/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Saahil Parikh - SaahilParikh[at)berkeley(dot]edu

Project Link: [https://github.com/SaahilParikh/Strawberry](https://github.com/SaahilParikh/Strawberry)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Cherry Timer](http://www.hammerspoon.org/Spoons/Cherry.html)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/SaahilParikh/Strawberry.svg?style=for-the-badge
[contributors-url]: https://github.com/SaahilParikh/Strawberry/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/SaahilParikh/Strawberry.svg?style=for-the-badge
[forks-url]: https://github.com/SaahilParikh/Strawberry/network/members
[stars-shield]: https://img.shields.io/github/stars/SaahilParikh/Strawberry.svg?style=for-the-badge
[stars-url]: https://github.com/SaahilParikh/Strawberry/stargazers
[issues-shield]: https://img.shields.io/github/issues/SaahilParikh/Strawberry.svg?style=for-the-badge
[issues-url]: https://github.com/SaahilParikh/Strawberry/issues
[license-shield]: https://img.shields.io/github/license/SaahilParikh/Strawberry.svg?style=for-the-badge
[license-url]: https://github.com/SaahilParikh/Strawberry/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/saahil-parikh-292698167
[product-screenshot]: https://cdn.pixabay.com/photo/2016/11/22/22/04/word-1850826_640.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://www.lua.org
[React.js]: https://img.shields.io/badge/lua-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
