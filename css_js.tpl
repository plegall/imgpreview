{combine_script id='jquery.imgpreview' load='header' require='jquery' path='plugins/imgpreview/js/imgpreview.js'}

{footer_script require='jquery.imgpreview'}
{if isset($imgpreview)}
{literal}
$('.thumbnails a, #thumbnails a').imgPreview({
    containerID: 'tooltip',
		srcAttr: 'imgsrc',
		considerBorders:'true',
    // When container is shown:
    onShow: function(link){
      {/literal}{if $imgpreview.title=="true"}{literal}
      $('<span>' + $(link).children().attr("title") + '</span>').appendTo(this);
      
      {/literal}{/if}{if $imgpreview.opacity=="true"}{literal}
      $(link).stop().animate({opacity:0.4});
      // Reset image:
      $('img', this).stop().css({opacity:0});
      {/literal}{/if}{literal}
    },
    onLoad: function(){
      {/literal}{if $imgpreview.opacity=="true"}{literal}
      $(this).animate({opacity:1}, 300);
      {/literal}{/if}{literal}
    },
    // When container hides: 
    onHide: function(link){
      {/literal}{if $imgpreview.title=="true"}{literal}
      $('span', this).remove();
      {/literal}{/if}{if $imgpreview.opacity=="true"}{literal}
      $(link).stop().animate({opacity:1});
      {/literal}{/if}{literal}
    }
});

{/literal}
{/if}
{/footer_script}

{combine_css path="plugins/imgpreview/css/imgpreview.css"}
{if isset($imgpreview)}
{html_head}
{literal}
<style>
#tooltip img {
{/literal}
	max-height: {$imgpreview.height}px;
	max-width: {$imgpreview.width}px;
{literal}
}
</style>
{/literal}{/html_head}
{/if}

