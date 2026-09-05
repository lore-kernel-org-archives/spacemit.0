Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDAC47141B
	for <spacemit@lists.linux.dev>; Sat,  5 Sep 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788606472; cv=none; b=DjkBmqcxV2ZcF4F9rCxOLvrrD/GfylJNN7N9xnue0yeatNXAKknMnRQriDo8MfnrrSTAZUfW2kO+YREoDviP+Kd4j139WN4jnp7QYJLBAMwAAXOYJtBrkNW9Q4vS3oRG01acQ51qAVAwftRO6JaLJ0yqEjCabwBTRs1s+Bo2zYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788606472; c=relaxed/simple;
	bh=neOmHNqibhnDvQpBl/JCo/CV45xtrh8kXS2h9g0iRHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsTTjeOC4Qy3JisWkj/+htdPC04w0LQMRAmSU+MLpjhKJNfVg5iLAKTjrFXUr7oLH9ZF76dowg/SVIMEAeu9Yk4qASwAi7HO1VEYCoZRM6P95+Jhm4uDqv5T4OWOEfQU+q1UfMqquZY8j0fgG35/bOP2t+hI4+GmFxbf20zVYk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdU8AfDX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdU8AfDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08E01F00A3E;
	Sat,  5 Sep 2026 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788606470;
	bh=th2iSjlblhbYXB2l6j+YOKazHB7xIu5uDLXEU8u9U8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JdU8AfDXE3c0UR7uiIci/7MwIvYpmXUsOaGjWP34ADWqEFhBbqDcVfVd6CaEp+nh2
	 nQiDOVAd6+pRmBviMi/VF5ya17AsMDu+umL8VDuB8Y+GRVDtODrlMvVHEc7AzREogw
	 GkRqJplYA25rYh679qfbrXJF+ULcITIIzJZE2s7wz2VdzIC607I5vJ7E9xavnP+bYT
	 /lMU32lFS1nqXne2qPfHkiXcEBxNyDrrXz5qS1jd7Iza1XeJ/ZBzBIhyDhZb+CsuQh
	 y2wVz9g306HsdsqFWnOfltcvIKIIa5f+D0I7typOgO1aLN6o3Ubaz1/koQa0BnpOk4
	 oCVWPUTmJH/1g==
Date: Sat, 5 Sep 2026 11:07:45 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: u-boot@lists.u-boot-project.org, Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Simon Glass <sjg@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Guodong Xu <guodong.xu@oss.qualcomm.com>, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] tools: mkimage: add SpacemiT K3 AIHD image support
Message-ID: <20260905110745-GKA84986@kernel.org>
References: <20260822-spacemit-aihd-v1-0-bf4c41993891@pigmoral.tech>
 <20260822-spacemit-aihd-v1-1-bf4c41993891@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-spacemit-aihd-v1-1-bf4c41993891@pigmoral.tech>

Hi Junhui,

On 16:56 Sat 22 Aug     , Junhui Liu wrote:
> The SpacemiT BootROM loads the FSBL from an AIHD image: a fixed 4 KiB
> header with two metadata headers and authentication information, followed
> by a 32-byte-aligned SPL payload and a trailing authentication area. K1
> and K3 share the same layout, but use different integrity and
> authentication schemes. K1 requires RSA-signed images, while K3 uses
> CRC32 to verify images in non-secure boot mode.
> 
> Add mkimage type "aihdimage" for the K3 CRC32 path. Populate both
> metadata headers, fill their CRC32 values and the payload CRC32, and
> reserve the authentication areas required by the layout. Only "-n k3" is
> wired up so far, but SoC differences already go through a variant table
> so K1 RSA signing can be added later.
> 
> The AIHD header has no reliable K1/K3 identifier, so the SoC is selected
> with -n. dumpimage is omitted for the same reason: it cannot take -n and
> therefore cannot differentiate between the two variants.
> 
> Only support for non-secure boot mode on the K3 SoC is implemented in
> this patch. K1 support and the RSA authentication scheme can be added
> later.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  boot/image.c      |   1 +
>  include/image.h   |   1 +
>  tools/Makefile    |   3 +-
>  tools/aihdimage.c | 202 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 206 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/image.c b/boot/image.c
> index 185d52ba492f..8dbfb677e631 100644
> --- a/boot/image.c
> +++ b/boot/image.c
> @@ -179,6 +179,7 @@ static const table_entry_t uimage_type[] = {
>  	{	IH_TYPE_TFA_BL31, "tfa-bl31",  "TFA BL31 Image", },
>  	{	IH_TYPE_STM32IMAGE_V2, "stm32imagev2", "STMicroelectronics STM32 Image V2.0" },
>  	{	IH_TYPE_AMLIMAGE,   "amlimage",   "Amlogic Boot Image" },
> +	{	IH_TYPE_AIHDIMAGE, "aihdimage", "SpacemiT AIHD Boot Image" },

Per documentation of RISC-V toolchain's vendor prefix convention[1], I'd suggest to name it as
IH_TYPE_SMTIMAGE, "smtimage", "SpacemiT Boot Image", vendor pick "AIHD" as magnic number but
has no speficial meaning, while using "smt" as the prefix would be better to recognize
 the format

Plus you may also need to adapt the commit message and code accordingly..

Link: https://github.com/riscv-non-isa/riscv-toolchain-conventions/blob/main/src/toolchain-conventions.adoc#list-of-vendor-prefixes [1]

>  	{	-1,		    "",		  "",			},
>  };
>  
> diff --git a/include/image.h b/include/image.h
> index 6edcb1995bfe..7d101960cac6 100644
> --- a/include/image.h
> +++ b/include/image.h
> @@ -235,6 +235,7 @@ enum image_type_t {
>  	IH_TYPE_TFA_BL31,		/* TFA BL31 image */
>  	IH_TYPE_STM32IMAGE_V2,		/* STMicroelectronics STM32 Image V2.0 */
>  	IH_TYPE_AMLIMAGE,		/* Amlogic Boot Image */
> +	IH_TYPE_AIHDIMAGE,		/* SpacemiT AIHD Boot Image */
>  
ditto
>  	IH_TYPE_COUNT,			/* Number of image types */
>  };
> diff --git a/tools/Makefile b/tools/Makefile
> index 535a5d51c89e..e838e16e0f05 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -110,7 +110,8 @@ KWB_IMAGE_OBJS-$(CONFIG_TOOLS_LIBCRYPTO) := kwbimage.o
>  ROCKCHIP_OBS = generated/lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
>  
>  # common objs for dumpimage and mkimage
> -dumpimage-mkimage-objs := aisimage.o \
> +dumpimage-mkimage-objs := aihdimage.o \
> +			aisimage.o \
>  			amlimage.o \
>  			atmelimage.o \
>  			$(FIT_OBJS-y) \
> diff --git a/tools/aihdimage.c b/tools/aihdimage.c
> new file mode 100644
> index 000000000000..e4e9ecdd97d9
> --- /dev/null
> +++ b/tools/aihdimage.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
> + *
> + * The SpacemiT AIHD boot image consists of a fixed image header followed by an
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
> +#define AIHD_MAGIC		"AIHD"
> +#define AIHD_PAYLOAD_ALIGN	32
> +#define AIHD_AUTH_SIZE		0x100
> +
> +#define AIHD_FLAG_CRC32		(1U << 0)
> +
> +/**
> + * struct aihdimage_header - metadata header within an AIHD image header
> + *
> + * @magic:	Magic (must be AIHD_MAGIC)
> + * @version:	Image version used when anti-rollback is enabled by eFuse
> + * @secure:	Version slot used when anti-rollback is enabled by eFuse
> + * @reserved:	Reserved
> + * @image_size:	Header0 stores the image header size
> + *		Header1 stores the aligned payload size
> + * @load_addr:	Unused
> + * @header_crc:	Header0 and Header1 store the CRC32 of the preceding 24 bytes on K3
> + * @image_crc:	Header1 stores the CRC32 of the aligned payload on K3
> + */
> +struct aihdimage_header {
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
> + * struct aihdimage_image_header - fixed header area of an AIHD image
> + *
> + * @root_key:	Root public key
> + * @header0:	Image layout and load information
> + * @key_data:	Key metadata
> + * @oem_keys:	OEM public-key area
> + * @signature0:	Signature of the image configuration
> + * @reserved:	Reserved
> + * @header1:	SPL payload information
> + */
> +struct aihdimage_image_header {
> +	uint8_t root_key[0x100];
> +	struct aihdimage_header header0;
> +	uint8_t key_data[0x1e0];
> +	uint8_t oem_keys[0x800];
> +	uint8_t signature0[AIHD_AUTH_SIZE];
> +	uint8_t reserved[0x3e0];
> +	struct aihdimage_header header1;
> +} __packed;
> +
> +/**
> + * struct aihdimage_variant - SoC-specific AIHD properties
> + *
> + * @name:	SoC name passed to mkimage with -n
> + * @flags:	SoC-specific AIHD flags
> + */
> +struct aihdimage_variant {
> +	const char *name;
> +	unsigned int flags;
> +};
> +
> +static const struct aihdimage_variant aihdimage_variants[] = {
> +	{
> +		.name = "k3",
> +		.flags = AIHD_FLAG_CRC32,
> +	},
> +};
> +
> +static const struct aihdimage_variant *aihdimage_get_variant(const char *name)
> +{
> +	int i;
> +
> +	if (!name || !*name)
> +		return NULL;
> +
> +	for (i = 0; i < ARRAY_SIZE(aihdimage_variants); i++)
> +		if (!strcmp(name, aihdimage_variants[i].name))
> +			return &aihdimage_variants[i];
> +
> +	return NULL;
> +}
> +
> +static void aihdimage_init_header(struct aihdimage_header *header, uint64_t image_size,
> +				  const struct aihdimage_variant *variant)
> +{
> +	uint32_t crc;
> +
> +	memcpy(header->magic, AIHD_MAGIC, sizeof(header->magic));
> +
> +	header->image_size = cpu_to_le64(image_size);
> +
> +	if (variant->flags & AIHD_FLAG_CRC32) {
> +		crc = crc32(0, (uint8_t *)header,
> +			    offsetof(struct aihdimage_header, header_crc));
> +		header->header_crc = cpu_to_le32(crc);
> +	}
> +}
> +
> +static int aihdimage_check_params(struct image_tool_params *params)
> +{
> +	if (!aihdimage_get_variant(params->imagename)) {
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
> +static void aihdimage_print_header(const void *buf, struct image_tool_params *params)
> +{
> +	const struct aihdimage_image_header *image_header = buf;
> +	const struct aihdimage_header *header1 = &image_header->header1;
> +	uint64_t payload_size = le64_to_cpu(header1->image_size);
> +
> +	printf("SpacemiT AIHD Boot Image (%s)\n", params->imagename);
> +	printf("Total Size: %llu bytes\n",
> +	       (unsigned long long)(sizeof(*image_header) + payload_size + AIHD_AUTH_SIZE));
> +	printf("Payload Size: %llu bytes\n", (unsigned long long)payload_size);
> +}
> +
> +static void aihdimage_set_header(void *buf, struct stat *sbuf, int infd,
> +				 struct image_tool_params *params)
> +{
> +	const struct aihdimage_variant *variant = aihdimage_get_variant(params->imagename);
> +	struct aihdimage_image_header *image_header = buf;
> +	struct aihdimage_header *header0 = &image_header->header0;
> +	struct aihdimage_header *header1 = &image_header->header1;
> +	size_t payload_size;
> +	uint32_t crc;
> +
> +	payload_size = sbuf->st_size - sizeof(*image_header) - AIHD_AUTH_SIZE;
> +
> +	aihdimage_init_header(header0, sizeof(*image_header), variant);
> +	aihdimage_init_header(header1, payload_size, variant);
> +
> +	if (variant->flags & AIHD_FLAG_CRC32) {
> +		crc = crc32(0, (uint8_t *)(image_header + 1), payload_size);
> +		header1->image_crc = cpu_to_le32(crc);
> +	}
> +}
> +
> +static int aihdimage_check_image_type(uint8_t type)
> +{
> +	if (type == IH_TYPE_AIHDIMAGE)
> +		return EXIT_SUCCESS;
> +
> +	return EXIT_FAILURE;
> +}
> +
> +static int aihdimage_vrec_header(struct image_tool_params *params,
> +				 struct image_type_params *tparams)
> +{
> +	size_t payload_size = params->file_size - tparams->header_size;
> +
> +	tparams->hdr = calloc(tparams->header_size, 1);
> +
> +	return ALIGN(payload_size, AIHD_PAYLOAD_ALIGN) - payload_size + AIHD_AUTH_SIZE;
> +}
> +
..
> +U_BOOT_IMAGE_TYPE(
> +	aihdimage,
> +	"SpacemiT AIHD Boot Image support",
> +	sizeof(struct aihdimage_image_header),
> +	NULL,
> +	aihdimage_check_params,
> +	NULL,
> +	aihdimage_print_header,
> +	aihdimage_set_header,
> +	NULL,
> +	aihdimage_check_image_type,
> +	NULL,
> +	aihdimage_vrec_header
> +);
> 
ditto
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)
