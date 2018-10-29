package store.service.product.rest

import java.time.{LocalDate, LocalDateTime}

import store.algebra.content._
import store.algebra.content.entity._
import store.json._
import store.algebra.product.{AddedAt, _}
import store.algebra.product.entity._
import store.algebra.product.entity.component._

/**
  * @author Daniel Incicau, daniel.incicau@busymachines.com
  * @since 04/08/2018
  */
trait ProductServiceJSON extends StoreJSON {

  implicit val productIDCirceCodec: Codec[ProductID] = Codec.instance[ProductID](
    encode = Encoder.apply[Long].contramap(ProductID.unapply),
    decode = Decoder.apply[Long].map(ProductID.apply)
  )

  implicit val categoryIDCirceCodec: Codec[CategoryID] = Codec.instance[CategoryID](
    encode = Encoder.apply[Int].contramap(CategoryID.unapply),
    decode = Decoder.apply[Int].map(CategoryID.apply)
  )

  implicit val sexCirceCodec: Codec[Sex] = Codec.instance[Sex](
    encode = Encoder.apply[String].contramap(sex => sex.productPrefix),
    decode = Decoder.apply[String].emap(s => Sex.fromString(s).left.map(_.message))
  )

  implicit val productSizeCirceCodec: Codec[ProductSize] = Codec.instance[ProductSize](
    encode = Encoder.apply[String].contramap(size => size.productPrefix),
    decode = Decoder.apply[String].emap(s => ProductSize.fromString(s).left.map(_.message))
  )

  implicit val countCirceCodec: Codec[Count] = Codec.instance[Count](
    encode = Encoder.apply[Int].contramap(_.count),
    decode = Decoder.apply[Int].emap(Count.apply(_).left.map(_.message))
  )

  implicit val priceCirceCodec: Codec[Price] = Codec.instance[Price](
    encode = Encoder.apply[Double].contramap(Price.unapply),
    decode = Decoder.apply[Double].map(Price.apply)
  )

  implicit val discountCirceCodec: Codec[Discount] = Codec.instance[Discount](
    encode = Encoder.apply[Double].contramap(_.percentage),
    decode = Decoder.apply[Double].emap(Discount(_).left.map(_.message))
  )

  implicit val contentIDCirceCodec: Codec[ContentID] = Codec.instance[ContentID](
    encode = Encoder.apply[String].contramap(ContentID.unapply),
    decode = Decoder.apply[String].map(ContentID.apply)
  )

  implicit val binaryContentCirceCodec: Codec[BinaryContent] = Codec.instance[BinaryContent](
    encode = Encoder.apply[Array[Byte]].contramap(BinaryContent.unapply),
    decode = Decoder.apply[Array[Byte]].map(BinaryContent.apply)
  )

  implicit val formatCirceCodec: Codec[Format] = Codec.instance[Format](
    encode = Encoder.apply[String].contramap(f => f.formatStr),
    decode = Decoder.apply[String].emap(s => Format.fromString(s).left.map(_.message))
  )

  implicit val descriptionParagraphCirceCodec: Codec[DescParagraph] = Codec.instance[DescParagraph](
    encode = Encoder.apply[String].contramap(DescParagraph.unapply),
    decode = Decoder.apply[String].map(DescParagraph.apply)
  )

  implicit val careParagraphCirceCodec: Codec[CareParagraph] = Codec.instance[CareParagraph](
    encode = Encoder.apply[String].contramap(CareParagraph.unapply),
    decode = Decoder.apply[String].map(CareParagraph.apply)
  )

  implicit val addedAtCirceCodec: Codec[AddedAt] = Codec.instance[AddedAt](
    encode = Encoder.apply[LocalDateTime].contramap(AddedAt.unapply),
    decode = Decoder.apply[LocalDateTime].map(AddedAt.apply)
  )

  implicit val promotionIDCirceCodec: Codec[PromotionID] = Codec.instance[PromotionID](
    encode = Encoder.apply[Long].contramap(PromotionID.unapply),
    decode = Decoder.apply[Long].map(PromotionID.apply)
  )

  implicit val promotionExpirationCirceCodec: Codec[PromotionExpiration] = Codec.instance[PromotionExpiration](
    encode = Encoder.apply[LocalDate].contramap(PromotionExpiration.unapply),
    decode = Decoder.apply[LocalDate].map(PromotionExpiration.apply)
  )

  implicit val contentCodec: Codec[Content] = derive.codec[Content]

  implicit val categoryCodec: Codec[Category] = derive.codec[Category]

  implicit val stockCodec: Codec[Stock] = derive.codec[Stock]

  implicit val storeProductCodec: Codec[StoreProduct] = derive.codec[StoreProduct]

  implicit val storeProductDefinitionCodec: Codec[StoreProductDefinition] = derive.codec[StoreProductDefinition]

  implicit val promotionCodec: Codec[Promotion] = derive.codec[Promotion]

  implicit val promotionDefinitionCodec: Codec[PromotionDefinition] = derive.codec[PromotionDefinition]

}
