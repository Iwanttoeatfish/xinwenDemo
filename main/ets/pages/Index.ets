import { router, Router } from '@kit.ArkUI';
import { bannerInfo, IBanner, INews, newsInfo } from './NewsInfo';

@Entry
@Component
struct NewsCase {
  @State message: string = 'Hello World';
  @State bannerInfo: Array<IBanner> = bannerInfo;
  private swiperController: SwiperController = new SwiperController();
  @State newsInfo: Array<INews> = newsInfo;

  build() {
    Column() {
      //头部
      Row({ space: 5 }) {
        Image($r('app.media.163_logo'))
          .width(40);
        Search({ placeholder: '输入查询内容' })
          .height(35)
          .layoutWeight(1)
          .backgroundColor(Color.White)
          .placeholderColor("#ffa29f9f")
          .searchIcon({ color: "#ff9d9a9a" })


        Button() {
          Image($r('app.media.ic_public_contacts'))
            .width(25)
            .fillColor(Color.White)
            .aspectRatio(1)
        }
        .opacity(0.4)
        .backgroundColor('#000000')
        .padding(5)

      }.padding(5)
      .backgroundColor(Color.Red)
      .width('100%')

      //Swiper
      Swiper(this.swiperController) {
        ForEach(this.bannerInfo, (item: IBanner, idx) => {
          Image(item.image)
            .width('100%')
            .alt($r('app.media.xin1'));
        }, (item: IBanner): string => {
          return String(item.id)
        })

      }.autoPlay(true)
      .interval(1000)
      .loop(true)
      .duration(1)

      //新闻列表

      List() {

        ForEach(this.newsInfo, (item: INews, idx: number) => {
          ListItem() {
            Row({ space: 5 }) {
              Column() {
                Text(item.title)
                  .fontSize(20)
                  .fontWeight(600)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Row() {
                  Text(item.author).margin({ right: 10 })
                    .fontColor('#999');
                  Text(item.msgcount < 10000 ?
                  String(item.msgcount) : item.msgcount / 10000 + '万')
                    .fontColor('#999');
                  Text('跟帖')
                    .fontColor('#999');
                }.padding(5)
                .width('100%')
              }.height(100)
              .justifyContent(FlexAlign.SpaceBetween)
              .layoutWeight(1)


              Image(item.imagefirst)
                .width(100)
                .alt($r('app.media.xin1'))
                .aspectRatio(1);
            }.width('100%')
            .border({ width: { bottom: 1 } })
            .borderColor('#eee')
            .padding(10);

          }.onClick(() => {
            router.pushUrl({
              url: 'pages/NewsDetailCase',
              params: item
            })
          });
        })

      }.width('100%')

    }
    .height('100%')
    .width('100%')
  }
}