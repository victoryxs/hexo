<div class="copyright">
  {% set current = date(Date.now(), "YYYY") %}
  &copy; &nbsp; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  {{ current }}
  <span class="with-love">
    <i class="icon-heart"></i>
  </span>
  <span class="author">{{ config.author }}</span>
</div>

<div class="copyright">
 <span id="busuanzi_container_site_uv">
  本站访客数<span id="busuanzi_value_site_uv"></span>人次
</span>
<iframe name="iframe_canvas" src="http://douban.fm/partner/baidu/doubanradio" scrolling="no" frameborder="0" width="0" height="0"></iframe> 
</div>


 <iframe name="iframe_canvas" src="http://douban.fm/partner/baidu/doubanradio" scrolling="no" frameborder="0" width="0" height="0"></iframe> 

 

<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="http://hexo.io">Hexo</a>') }}
</div>

<div class="theme-info">
  {{ __('footer.theme') }} -
  <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">
    NexT{% if theme.scheme %}.{{ theme.scheme }}{% endif %}
  </a>
</div>

{% block footer %}{% endblock %}
<script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js">
</script>

<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery-lazyload/1.9.5/jquery.lazyload.min.js"></script>
    <script type="text/javascript">
      jQuery(function() {          
          jQuery("#posts img").lazyload({
            placeholder:"http://www.arao.me/loading.gif",
              effect:"fadeIn",
              threshold:200
            });
          });
  </script>