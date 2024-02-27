module Jekyll
    class SitemapGenerator < Generator
      priority :low
  
      def generate(site)
        @site = site
        generate_sitemap
      end
  
      private
  
      def generate_sitemap
        File.open(File.join(@site.dest, 'sitemap.xml'), 'w') do |sitemap|
          sitemap.puts('<?xml version="1.0" encoding="UTF-8"?>')
          sitemap.puts('<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">')
  
          # Add home page URL
          write_url(sitemap, site_url)
  
          # Add URLs for all pages and posts
          @site.pages.each { |page| write_url(sitemap, page.url) }
          @site.posts.docs.each { |post| write_url(sitemap, post.url) }
  
          sitemap.puts('</urlset>')
        end
      end
  
      def write_url(sitemap, url)
        sitemap.puts("  <url>")
        sitemap.puts("    <loc>#{site_url}#{url}</loc>")
        sitemap.puts("  </url>")
      end
  
      def site_url
        @site.config['url'] || 'https://motaionx.github.io'  # Update with your site URL
      end
    end
  end
  