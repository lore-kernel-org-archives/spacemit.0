Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8073D9538
	for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393263; cv=pass; b=Scy/59AML+YEfFmQSBFe1FvHYeCrO/6usc1t3aQC33wo/0CrL9wE42oCL8rFHlq/T8I58m5T0jgts8ffLaiVTKBh6JGs1XoI/pHQHV085rpemOAvuBG3jokHX1nt0qe3hgsSepAQhRqvlWyg/uT7uEZkml3DlUe69HbTYVUXxFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393263; c=relaxed/simple;
	bh=68ff8uNkZtwfIzFsSKh31xS0MiPOWRPcE3bACJHGRtg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=J0gQObMb/fcPU16tGO4kol1gz/27WFwMK7CRp5vLknhlJ56qAtHPszDdAFxcTEDip7pzZPKVeToAjxMk4IQIs9egPVJI45Y+ZR2WUDJEllFyLdPEk4JIPXeveTdhHWsypihaDTvTMhqrq7qJeTmTpMsixe31CXGjNcj/A7vM4P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=hdycfjcP; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="hdycfjcP"
ARC-Seal: i=1; a=rsa-sha256; t=1789393247; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CgJi5D+2ahzQA+plNd9h208+FDj1xv4SXdy4PSMgQJhvXMn7ngIQMqC8qG5QpyQLMAA7tBnFz+KA3cOQj0PTYPYC4D1ysigvUdg50NT+8RC64d9y6Gj0xBL3jFrxJQy0zvWNLZHgPYt4S2ud4jsdsTzy9qwI5jV0KHwNaIFMMQw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789393247; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zVlbntJQ2vf0SpXE9Ll7yQeXkxsBPNYBMl0NOfmI05Y=; 
	b=SdiQedLomEq72uGGmHZ+G4Spt1WvjY9gx+6zei+KkGSDR23mfCC5n5hAvsLwkcZybSSmLi3WYhpQwquK3chIwDrLn5TxFi3J00Lat2FudUODGU8+Ub8Xb0509e5oyoPUEQf4MtbtZHg3XZuCGGhhyTsmUsKEB+qzXCHrnGz3VA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789393247;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=zVlbntJQ2vf0SpXE9Ll7yQeXkxsBPNYBMl0NOfmI05Y=;
	b=hdycfjcPEo6UnyyziiZYoVJvEyqofUhKY1dbrWZGa8m1pTJ9YLaCeuV0pbmqoOs3
	WUvzJF0fvL35rY28pyz2XKeI15ed79qI1GIaRGVtwo6bROUUGYvk8b6tZMUKJKTdxn/
	lwibYcpo2hyWhlLRx/wuN+x26f3e08bCQ+ZpJzX4=
Received: by mx.zohomail.com with SMTPS id 1789393244931384.04903856238764;
	Mon, 14 Sep 2026 06:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 21:40:38 +0800
Message-Id: <DLF2YPC4AMIP.2P3Y1FNCF085N@pigmoral.tech>
Cc: <u-boot@lists.u-boot-project.org>, "Tom Rini" <trini@konsulko.com>,
 "Quentin Schulz" <quentin.schulz@cherry.de>, "Simon Glass"
 <sjg@chromium.org>, "Daniel Golle" <daniel@makrotopia.org>, "Randolph Sapp"
 <rs@ti.com>, "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, "Kory
 Maincent" <kory.maincent@bootlin.com>, "E Shattow" <e@freeshell.de>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 1/2] tools: mkimage: add SpacemiT K3 boot image
 support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Yixun Lan" <dlan@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20260909-spacemit-aihd-v2-0-780e98cf2fec@pigmoral.tech>
 <20260909-spacemit-aihd-v2-1-780e98cf2fec@pigmoral.tech>
 <20260910100231-GKI2330@kernel.org>
In-Reply-To: <20260910100231-GKI2330@kernel.org>
X-ZohoMailClient: External

Hi Yixun,
Thanks for your comments, I will address them.

On Thu Sep 10, 2026 at 6:02 PM CST, Yixun Lan wrote:
> Hi Junhui,
>
> The patch looks good to me, I only have a few minor comments.
>
> On 23:51 Wed 09 Sep     , Junhui Liu wrote:

[...]

>> +#define SMT_AUTH_SIZE		0x100
>> +
> ..
>> +#define SMT_FLAG_CRC32		(1U << 0)
> is this a local flag? how about defining as BIT(0)? which is more readabl=
e IMO=20

The BIT() macro is only available when building U-Boot itself and is not
exposed to host tools, so I'll keep the current expression.

>
>> +
>> +/**
>> + * struct smtimage_header - metadata header within a SpacemiT boot imag=
e header
>> + *
>> + * @magic:	Magic (must be SMT_MAGIC)
>> + * @version:	Image version used when anti-rollback is enabled by eFuse
>> + * @secure:	Version slot used when anti-rollback is enabled by eFuse
>> + * @reserved:	Reserved
>> + * @image_size:	Header0 stores the image header size
>> + *		Header1 stores the aligned payload size
>> + * @load_addr:	Unused
>> + * @header_crc:	Header0 and Header1 store the CRC32 of the preceding 24=
 bytes on K3
>> + * @image_crc:	Header1 stores the CRC32 of the aligned payload on K3
>> + */
>> +struct smtimage_header {
>> +	uint8_t magic[4];
>> +	uint8_t version;
>> +	uint8_t secure;
>> +	uint16_t reserved;
>> +	uint64_t image_size;
>> +	uint64_t load_addr;
>> +	uint32_t header_crc;
>> +	uint32_t image_crc;
>> +} __packed;
>> +
>> +/**
>> + * struct smtimage_image_header - fixed header area of a SpacemiT boot =
image
>> + *
>> + * @root_key:	Root public key
>> + * @header0:	Image layout and load information
>> + * @key_data:	Key metadata
>> + * @oem_keys:	OEM public-key area
>> + * @signature0:	Signature of the image configuration
>> + * @reserved:	Reserved
>> + * @header1:	SPL payload information
>> + */
>> +struct smtimage_image_header {
>> +	uint8_t root_key[0x100];
>> +	struct smtimage_header header0;
>> +	uint8_t key_data[0x1e0];
>> +	uint8_t oem_keys[0x800];
>> +	uint8_t signature0[SMT_AUTH_SIZE];
>> +	uint8_t reserved[0x3e0];
>> +	struct smtimage_header header1;
>> +} __packed;
>> +
>> +/**
>> + * struct smtimage_variant - SoC-specific image properties
>> + *
>> + * @name:	SoC name passed to mkimage with -n
>> + * @flags:	SoC-specific image flags
>> + */
>> +struct smtimage_variant {
>> +	const char *name;
>> +	unsigned int flags;
>> +};
>> +
>> +static const struct smtimage_variant smtimage_variants[] =3D {
>> +	{
>> +		.name =3D "k3",
>> +		.flags =3D SMT_FLAG_CRC32,
>> +	},
> you may want to define a macro if adding too many more variants which wil=
l
>  make code more compact..
> #define VARIANT(name, flag) 		\
>      {					\
>              .name =3D "k3",		\
>              .flags =3D SMT_FLAG_CRC32,	\
>      }
> but I'm fine with current version if you're relunctant to change

I'll keep the current form, as introducing a macro wouldn't simplify
much and would make the code less readable.

> [...]

--=20
Best regards,
Junhui Liu
