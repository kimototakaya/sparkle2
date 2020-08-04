$(function(){
  function buildHTML(post){
    if (post.id){
      let html = 
      `<div class="topic-title">
        ${post.title}
      </div>
      <div class="topic-content">
        ${post.content}
      </div>`
    return html;
    } else (){
      let html =
      `<h1>まだ投稿はありません
      </h1>`
    }
  }
});