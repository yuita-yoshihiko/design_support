import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu", "content"]

  /* メニュータブをクリックしたら発火するアクション */
  menuClick(event){
    const menus = this.menuTargets // メニューバー全体の要素
    const current = event.currentTarget // クリックしたメニューバーの要素（現在地）
    const currentIndex = menus.indexOf(current) // クリックしたメニューバーのインデックス番号
    const contents = this.contentTargets // コンテンツ全体の要素

    menus.forEach((menu, index)=>{ // 初期化
      if(current.classList.contains("not-active")){
        menu.classList.remove("is-active")
        menu.classList.add("not-active")
        contents[index].classList.add("hidden")
      }
    })

    if(current.classList.contains("not-active")){ // クリックしたメニューのclassをアクティブにする
      current.classList.remove("not-active")
      current.classList.add("is-active")
      contents[currentIndex].classList.remove("hidden") // クリックした要素のコンテンツを表示する
    }
  }

}

$(function() {
  $('#nav li').on("click mouseover", function(e) {
      $('ul', this).stop().slideDown('fast');
  })

  .mouseout(function(e) {
      $('ul', this).stop().slideUp('fast');
  });
});