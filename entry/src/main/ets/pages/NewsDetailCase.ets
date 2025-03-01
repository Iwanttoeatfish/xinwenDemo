import { router } from '@kit.ArkUI'
import { INews } from './NewsInfo';

@Entry
@Component
struct NewsDetailCase {
  @State news: INews = {} as INews;

  onPageShow(): void {
    this.news = router.getParams() as INews;
  }

  build() {
    Column() {
      //头部
      Navigation() {
        //页头
        Row() {

          Image($r('app.media.news_logo_img'))
            .width(32);

          Column() {
            Text(this.news.author)
            Text(`${this.news.time}·${this.news.area}`)
              .fontSize(10)
              .fontColor('#999')
          }.layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          /*Row({ space: 5 }) {
            Image($r('app.media.ic_public_comments'))
              .width(32)
              .aspectRatio(1);

            Text(this.news.msgcount > 10000 ? this.news.msgcount / 10000 + "万" : String(this.news.msgcount));
          }.backgroundColor('#e3e4e5')
          .padding({
            left: 10,
            right: 10,
            top: 5,
            bottom: 5
          })
          .borderRadius(20)*/
        }.width('100%')
        .padding(10)

        //内容
        if (this.news.imagefirst != undefined) {
          Image(this.news.imagefirst)
            .width('95%')
        }


        Scroll() {
          Text(this.news.content);
        }.margin({ top: 10 })
        .layoutWeight(1)
      }.titleMode(NavigationTitleMode.Mini)
      .title(this.news.title)
     /* .menus([
        {
          icon: '/images/ic_public_contacts.svg'
        } as NavigationMenuItem
      ])*/

    }
    .height('100%')
    .width('100%')
  }
}