Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0CD37FF75
	for <spacemit@lists.linux.dev>; Thu, 10 Sep 2026 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034556; cv=none; b=FmKZqvr9rneOBBUa/9R4i/rvcVhNB09LwuyMskANFE3QC9/hEnte9yCeu/DcWjF0fL7GQGeJCLgxhQLuIQlXKTe/+9OegmHyHfLQ3vFNHeJBnDFfP8vWOpoNoV1MmBXtCLQBjVTQk8BFlCwAybF0wHZtyOwcPxJgXHtUWE2PMuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034556; c=relaxed/simple;
	bh=AuL1NopOUDRlUm9/LjeQ25gulUiO2TrVF/co05BGUPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ5t3STJVFjP05sOkP9JrVeT595FpwM8YRhCj7iYIIFcB2z7VrHU++wM8EK/RfnjW1vT9vv2ZfIdIYpkkkdL0iamhApJJLUV7X9L2tJTN47ccYf1CcVWTzYh1I81JlGRdlz83cFGyP5vz6Gm7qK3mHg5+XWK292irJamWe67OH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ngoq4AJ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ngoq4AJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891E01F000FF;
	Thu, 10 Sep 2026 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789034554;
	bh=+ENjMczPuH/fyANI/+/yq26/n7fvzUZFAAXgyCAWW+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ngoq4AJ3fRog5fjfiGV4mq1x3Dj99JaCs25ndwWB0HIpxjGGVczRdYQsNm9/G4A+7
	 SLXts7YUcYo8jWDlCg6k8FWWFyNl7OiMUJyf86F99MG5kx/PfeRJesKYGop0Xstzwo
	 fEDw0rAHMZ/g3HnyQoZNVGxc6LShlpxvTjheTwh7Xvfi0nEGKk6efU1MRkmO+9blzH
	 M2i2pk6ZxuMY6QNl6IANL5NqqznDH0ri/mSiEzejDLyFvIAbNoh8MDHaleYej64f9w
	 3TKxZZQpMD6EJ1mrzyptzCht2ISMDqXMqs2QULGh6PdlfXLVYGMGprLL5FkwLd0Tto
	 l0gq2AT2bkYtw==
Date: Thu, 10 Sep 2026 10:02:31 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: u-boot@lists.u-boot-project.org, Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Simon Glass <sjg@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	E Shattow <e@freeshell.de>, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/2] tools: mkimage: add SpacemiT K3 boot image support
Message-ID: <20260910100231-GKI2330@kernel.org>
References: <20260909-spacemit-aihd-v2-0-780e98cf2fec@pigmoral.tech>
 <20260909-spacemit-aihd-v2-1-780e98cf2fec@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909-spacemit-aihd-v2-1-780e98cf2fec@pigmoral.tech>

Hi Junhui,

The patch looks good to me, I only have a few minor comments.

On 23:51 Wed 09 Sep     , Junhui Liu wrote:
> The SpacemiT BootROM loads the FSBL from a boot image consisting of a
> fixed 4 KiB header with two metadata headers and authentication
> information, followed by a 32-byte-aligned SPL payload and a trailing
> authentication area. K1 and K3 share the same layout, but use different
> integrity and authentication schemes. K1 requires RSA-signed images,
> while K3 uses CRC32 to verify images in non-secure boot mode.
> 
> Add mkimage type "smtimage" for the K3 CRC32 path. Populate both
> metadata headers, fill their CRC32 values and the payload CRC32, and
> reserve the authentication areas required by the layout.
> 
> The image header has no reliable K1/K3 identifier, so select the SoC
> with -n. Omit dumpimage support since it cannot take -n to distinguish
s/-n/-n option/
> between the variants.
> 
> Only "-n k3" in non-secure boot mode is supported. Route SoC differences
> through a variant table so K1 and RSA authentication support can be
> added later.
> 
> Tested-by: E Shattow <e@freeshell.de>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  boot/image.c     |   1 +
>  include/image.h  |   1 +
>  tools/Makefile   |   1 +
>  tools/smtimage.c | 202 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 205 insertions(+)
> 
> diff --git a/boot/image.c b/boot/image.c
> index 185d52ba492f..3a31ef663710 100644
> --- a/boot/image.c
> +++ b/boot/image.c
> @@ -179,6 +179,7 @@ static const table_entry_t uimage_type[] = {
>  	{	IH_TYPE_TFA_BL31, "tfa-bl31",  "TFA BL31 Image", },
>  	{	IH_TYPE_STM32IMAGE_V2, "stm32imagev2", "STMicroelectronics STM32 Image V2.0" },
>  	{	IH_TYPE_AMLIMAGE,   "amlimage",   "Amlogic Boot Image" },
> +	{	IH_TYPE_SMTIMAGE, "smtimage", "SpacemiT Boot Image" },
I found most entry align with 4 space.. should do same as above line

>  	{	-1,		    "",		  "",			},
>  };
>  
> diff --git a/include/image.h b/include/image.h
> index 6edcb1995bfe..53aad2dfde3f 100644
> --- a/include/image.h
> +++ b/include/image.h
> @@ -235,6 +235,7 @@ enum image_type_t {
>  	IH_TYPE_TFA_BL31,		/* TFA BL31 image */
>  	IH_TYPE_STM32IMAGE_V2,		/* STMicroelectronics STM32 Image V2.0 */
>  	IH_TYPE_AMLIMAGE,		/* Amlogic Boot Image */
> +	IH_TYPE_SMTIMAGE,		/* SpacemiT Boot Image */
>  
>  	IH_TYPE_COUNT,			/* Number of image types */
>  };
> diff --git a/tools/Makefile b/tools/Makefile
> index 535a5d51c89e..fc0aa52455aa 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -138,6 +138,7 @@ dumpimage-mkimage-objs := aisimage.o \
>  			pbl_crc32.o \
>  			renesas_spkgimage.o \
>  			sfspl.o \
> +			smtimage.o \
>  			vybridimage.o \
>  			stm32image.o \
>  			$(ROCKCHIP_OBS) \
> diff --git a/tools/smtimage.c b/tools/smtimage.c
> new file mode 100644
> index 000000000000..96e8b5d8d171
> --- /dev/null
> +++ b/tools/smtimage.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
> + *
> + * The SpacemiT boot image consists of a fixed image header followed by an
> + * aligned SPL payload and a trailing authentication area. The image header
> + * contains two metadata headers and areas reserved for authentication data.
> + *
> + * The image layout is:
> + *
> + *   0x000             root key
> + *   0x100             header0
> + *   0x120             key metadata
> + *   0x300             OEM keys
> + *   0xb00             signature0
> + *   0xfe0             header1
> + *   0x1000            SPL payload, with its end aligned to 32 bytes
> + *   payload end       signature1 (0x100 bytes)
> + */
> +
> +#include <image.h>
> +#include <u-boot/crc.h>
> +#include "imagetool.h"
> +
> +#define SMT_MAGIC		"AIHD"
..
> +#define SMT_PAYLOAD_ALIGN	32
it occur to me, it's not necessary to introduce a local macro which only
 used once? while it's quite obvious what ALIGN() means

> +#define SMT_AUTH_SIZE		0x100
> +
..
> +#define SMT_FLAG_CRC32		(1U << 0)
is this a local flag? how about defining as BIT(0)? which is more readable IMO 

> +
> +/**
> + * struct smtimage_header - metadata header within a SpacemiT boot image header
> + *
> + * @magic:	Magic (must be SMT_MAGIC)
> + * @version:	Image version used when anti-rollback is enabled by eFuse
> + * @secure:	Version slot used when anti-rollback is enabled by eFuse
> + * @reserved:	Reserved
> + * @image_size:	Header0 stores the image header size
> + *		Header1 stores the aligned payload size
> + * @load_addr:	Unused
> + * @header_crc:	Header0 and Header1 store the CRC32 of the preceding 24 bytes on K3
> + * @image_crc:	Header1 stores the CRC32 of the aligned payload on K3
> + */
> +struct smtimage_header {
> +	uint8_t magic[4];
> +	uint8_t version;
> +	uint8_t secure;
> +	uint16_t reserved;
> +	uint64_t image_size;
> +	uint64_t load_addr;
> +	uint32_t header_crc;
> +	uint32_t image_crc;
> +} __packed;
> +
> +/**
> + * struct smtimage_image_header - fixed header area of a SpacemiT boot image
> + *
> + * @root_key:	Root public key
> + * @header0:	Image layout and load information
> + * @key_data:	Key metadata
> + * @oem_keys:	OEM public-key area
> + * @signature0:	Signature of the image configuration
> + * @reserved:	Reserved
> + * @header1:	SPL payload information
> + */
> +struct smtimage_image_header {
> +	uint8_t root_key[0x100];
> +	struct smtimage_header header0;
> +	uint8_t key_data[0x1e0];
> +	uint8_t oem_keys[0x800];
> +	uint8_t signature0[SMT_AUTH_SIZE];
> +	uint8_t reserved[0x3e0];
> +	struct smtimage_header header1;
> +} __packed;
> +
> +/**
> + * struct smtimage_variant - SoC-specific image properties
> + *
> + * @name:	SoC name passed to mkimage with -n
> + * @flags:	SoC-specific image flags
> + */
> +struct smtimage_variant {
> +	const char *name;
> +	unsigned int flags;
> +};
> +
> +static const struct smtimage_variant smtimage_variants[] = {
> +	{
> +		.name = "k3",
> +		.flags = SMT_FLAG_CRC32,
> +	},
you may want to define a macro if adding too many more variants which will
 make code more compact..
#define VARIANT(name, flag) 		\
     {					\
             .name = "k3",		\
             .flags = SMT_FLAG_CRC32,	\
     }
but I'm fine with current version if you're relunctant to change

> +};
> +
> +static const struct smtimage_variant *smtimage_get_variant(const char *name)
> +{
> +	int i;
> +
> +	if (!name || !*name)
> +		return NULL;
> +
> +	for (i = 0; i < ARRAY_SIZE(smtimage_variants); i++)
> +		if (!strcmp(name, smtimage_variants[i].name))
> +			return &smtimage_variants[i];
> +
> +	return NULL;
> +}
> +
> +static void smtimage_init_header(struct smtimage_header *header, uint64_t image_size,
> +				 const struct smtimage_variant *variant)
> +{
> +	uint32_t crc;
> +
> +	memcpy(header->magic, SMT_MAGIC, sizeof(header->magic));
> +
> +	header->image_size = cpu_to_le64(image_size);
> +
> +	if (variant->flags & SMT_FLAG_CRC32) {
> +		crc = crc32(0, (uint8_t *)header,
> +			    offsetof(struct smtimage_header, header_crc));
> +		header->header_crc = cpu_to_le32(crc);
> +	}
> +}
> +
> +static int smtimage_check_params(struct image_tool_params *params)
> +{
> +	if (!smtimage_get_variant(params->imagename)) {
> +		fprintf(stderr, "%s: SpacemiT SoC must be specified with -n\n",
> +			params->cmdname);
> +		return EXIT_FAILURE;
> +	}
> +
> +	if (!params->dflag)
> +		return EXIT_FAILURE;
> +
> +	return EXIT_SUCCESS;
> +}
> +
> +static void smtimage_print_header(const void *buf, struct image_tool_params *params)
> +{
> +	const struct smtimage_image_header *image_header = buf;
> +	const struct smtimage_header *header1 = &image_header->header1;
> +	uint64_t payload_size = le64_to_cpu(header1->image_size);
> +
> +	printf("SpacemiT Boot Image (%s)\n", params->imagename);
or make it slightly more readable
        printf("Spacemit Boot Image\n");
        printf("SoC Variant: %s\n", params->imagename);

> +	printf("Total Size: %llu bytes\n",
> +	       (unsigned long long)(sizeof(*image_header) + payload_size + SMT_AUTH_SIZE));
> +	printf("Payload Size: %llu bytes\n", (unsigned long long)payload_size);
> +}
> +
> +static void smtimage_set_header(void *buf, struct stat *sbuf, int infd,
> +				struct image_tool_params *params)
> +{
> +	const struct smtimage_variant *variant = smtimage_get_variant(params->imagename);
> +	struct smtimage_image_header *image_header = buf;
> +	struct smtimage_header *header0 = &image_header->header0;
> +	struct smtimage_header *header1 = &image_header->header1;
> +	size_t payload_size;
> +	uint32_t crc;
> +
> +	payload_size = sbuf->st_size - sizeof(*image_header) - SMT_AUTH_SIZE;
> +
> +	smtimage_init_header(header0, sizeof(*image_header), variant);
> +	smtimage_init_header(header1, payload_size, variant);
> +
> +	if (variant->flags & SMT_FLAG_CRC32) {
> +		crc = crc32(0, (uint8_t *)(image_header + 1), payload_size);
> +		header1->image_crc = cpu_to_le32(crc);
> +	}
> +}
> +
> +static int smtimage_check_image_type(uint8_t type)
> +{
> +	if (type == IH_TYPE_SMTIMAGE)
> +		return EXIT_SUCCESS;
> +
> +	return EXIT_FAILURE;
> +}
> +
> +static int smtimage_vrec_header(struct image_tool_params *params,
> +				struct image_type_params *tparams)
> +{
> +	size_t payload_size = params->file_size - tparams->header_size;
> +
> +	tparams->hdr = calloc(tparams->header_size, 1);
> +
> +	return ALIGN(payload_size, SMT_PAYLOAD_ALIGN) - payload_size + SMT_AUTH_SIZE;
> +}
> +
> +U_BOOT_IMAGE_TYPE(
> +	smtimage,
> +	"SpacemiT Boot Image support",
> +	sizeof(struct smtimage_image_header),
> +	NULL,
> +	smtimage_check_params,
> +	NULL,
> +	smtimage_print_header,
> +	smtimage_set_header,
> +	NULL,
> +	smtimage_check_image_type,
> +	NULL,
> +	smtimage_vrec_header
> +);
> 
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)
