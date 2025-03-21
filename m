Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1521E7C0B
	for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742575878; cv=none; b=tdGVv1mfGdcWzChlVj7HMVchu7wxeMDVIrPfrttOqy5gBVv5Tk6siH8k6KoFT3GHSyz0bXw2J6xJsSVWXGnkTjUzhn2PWHhC0H+eJlRiGLwjR9T7pGvSzlj/jbanCziDxCpFMc680EkCfBblcFmcnZrAYhm3bUV6WrMTlUAsJ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742575878; c=relaxed/simple;
	bh=mbKr0+rtZEmdF/mZsAZ97VBzgPF9w94dbXE77Hy8CHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JcY95aGTc+SHNc7sB04yrEWszubzstFJZEmTB2KND0fjEWdV/uj2ciFSDaRYDP9Ey6Nq37IQyToYJulUlpBv3Lo6Az7BBzt/4fQJ6oT5ala4CdRLemtVBaE2mtiJOaHeQB75RxO63sctOUqgnooTAojwq3WJHQPSbaI3PCMGSxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HfQ2iAER; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HfQ2iAER"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso75019339f.0
        for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 09:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742575875; x=1743180675; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzK1WGYHzNSQEzJMM5cCsywytwS/BE8E1AY6ka1PBNQ=;
        b=HfQ2iAERZHXlg4IXOND0wSQHchSw2u5zgYp2jQoBU+5zypVcjczOUr5AChbQkwZLiA
         GBUzA3vFZaSs8yWnhgT4u5O8ofTFpMyxx8fyDFDjEymuQBON+t6zDkNvVC9gwCbEj/su
         HmOqii5wv9ETbCBBVAtw9Rl2e32C/BSSoMqRhamlfpRzAyCp+0wSXoH1UHvQhMkDwSBF
         DxS/SlNVdS5ZdApLb5F+bYT+50omU0rvPfUybsuKWWkkjInfzNFO1xB7e3mjk3gfac3j
         nuj4ErRLSp0p2nUhJpUc+glDpDdLhVg9fOTV1y5wVX5HqVaHUbqCZHgV0jQ28nF6pVql
         CAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575875; x=1743180675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzK1WGYHzNSQEzJMM5cCsywytwS/BE8E1AY6ka1PBNQ=;
        b=jDAmt6eh08ZdEr36dQWOQmOZIMblD0l5D+Dl3A89eEppLKzyqdjRf6Lbn17F0DRlre
         XmN90W8KzbydQZkFaljJ7Lv9F8Poc9TGRm14W6hO9lYV5K5ydAKmHc8dEP5vGc53PIip
         4oAWSSvBuFN8SdMwd46ZDUX+63uzmfvNvaOdu1JqZy1eIngGWm25K08tXRT5vBgW0yjt
         rlMkhMNXCyAtTJYMcgLFTESrG/wyI+QNveHvC7Edrz7eZV7YT7qwcP2eA7z6shsTmlm/
         K4q7WnoQ1c+6HTiUnUnfb+JZPvjjsH8bFVBYm8PKoapcEbui46RCddroYJUaLskR2Lre
         ovYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVplZhuz/WZAD9pFp0pewma33jhwWWPsA5gdsVFSOg9jZps2c1UpG7o8p5GHTdOj9byX/6BEVaesQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/pa8MBGB28MJ42Q0YomlMx/L29290orEaFAQm8TgJGuY+1jlK
	u6RdOC4ZMFh1s5vnCh6vam9QXZ4kg+j0w0iucreLh89FkIb6it4uyZtDZWNVerw=
X-Gm-Gg: ASbGncstvYvqGEjZuSoZflmVwwiWkSd5bDFN2gdkEIdi54vyZXwruAQ5P6VMOdJb0JE
	9o+Kj94NkWlmUkZgXVpA3Ml8//HBBqeAoYMZFZp/0thFz6AKZeem19/eV9+tmXKCvcVmsucamRu
	z80feeiGchUiHdO2PYm+78EI/r86D6rMagTQQFFi7Q0QDlQuVW7fx+m2vVZGG2FRsqqJ4S7g/g/
	sZI2mdgKQnQ8l1ASo4Xh7JPaemfZsrw//U8YvRfOUVFvgYZKmEn85S6NZMyyFWusekLhP5FTZ08
	w2DYSRomqwBEDoQOzddtMIyG7R1Jmc1+spF6dFj0ZUMw153NSDYrtkY5lOE0FtgdTyzHS6sPkkL
	zfrz6+eqFZaqigp6N1w==
X-Google-Smtp-Source: AGHT+IH20L7xZ9FbSSWQT43kyWkhTGHjv6LRqusofBtW84SCRx5VKyrgNItG2BhiTqAgVRCVgxE9tA==
X-Received: by 2002:a05:6602:6a89:b0:85b:4cb9:5cf6 with SMTP id ca18e2360f4ac-85e2bc71838mr361639039f.0.1742575875339;
        Fri, 21 Mar 2025 09:51:15 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm45863839f.11.2025.03.21.09.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:51:14 -0700 (PDT)
Message-ID: <b0583550-eb2c-4918-b9e7-7041d3fd2e9e@riscstar.com>
Date: Fri, 21 Mar 2025 11:51:13 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250213-20-k1-sdhci-v1-0-1f4362a980cd@gentoo.org>
 <20250213-20-k1-sdhci-v1-2-1f4362a980cd@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250213-20-k1-sdhci-v1-2-1f4362a980cd@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/25 4:58 AM, Yixun Lan wrote:
> The SDHCI controller found in SpacemiT K1 SoC features SD,
> SDIO, eMMC support, such as:
> 
> - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> - Compatible for 8bit eMMC5.1, up to HS400
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Why is this RFC? Have you tested it?

I have a few minor comments but this seems reasonable to me.

> ---
>   drivers/mmc/host/Kconfig       |  14 ++
>   drivers/mmc/host/Makefile      |   1 +
>   drivers/mmc/host/sdhci-of-k1.c | 320 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 335 insertions(+)

. . .

> +#define SDHC_PHY_DLLCFG			0x168
> +#define  DLL_PREDLY_NUM			0x04
> +#define  DLL_FULLDLY_RANGE		0x10
> +#define  DLL_VREG_CTRL			0x40
> +#define  DLL_ENABLE			0x80000000
> +#define  DLL_REFRESH_SWEN_SHIFT		0x1C
> +#define  DLL_REFRESH_SW_SHIFT		0x1D
> +
> +#define SDHC_PHY_DLLCFG1		0x16C
> +#define  DLL_REG2_CTRL			0x0C
> +#define  DLL_REG3_CTRL_MASK		0xFF

As Adrian said, please use GENMASK() (or BIT()) to define
these masks, and FIELD_GET() or similar to manipulate them.
I prefer lower-case hex digits too.

> +#define  DLL_REG3_CTRL_SHIFT		0x10
> +#define  DLL_REG2_CTRL_MASK		0xFF
> +#define  DLL_REG2_CTRL_SHIFT		0x08
> +#define  DLL_REG1_CTRL			0x92
> +#define  DLL_REG1_CTRL_MASK		0xFF
> +#define  DLL_REG1_CTRL_SHIFT		0x00
> +
> +#define SDHC_PHY_DLLSTS			0x170
> +#define  DLL_LOCK_STATE			0x01
> +
> +#define SDHC_PHY_DLLSTS1		0x174
> +#define  DLL_MASTER_DELAY_MASK		0xFF
> +#define  DLL_MASTER_DELAY_SHIFT		0x10
> +
> +#define SDHC_PHY_PADCFG_REG		0x178
> +#define  RX_BIAS_CTRL			BIT(5)
> +#define  PHY_DRIVE_SEL_MASK		0x7
> +#define  PHY_DRIVE_SEL_DEFAULT		0x4
> +
> +struct spacemit_sdhci_host {
> +	struct clk *clk_core;
> +	struct clk *clk_io;
> +};
> +

I don't think the next few functions add any real value.

Just call sdhci_writel() and sdhci_readl() directly.  It
might even take fewer characters (but above all, I think
it's clearer without the function hiding what's done).

> +static inline void spacemit_sdhci_setbits(struct sdhci_host *host, u32 val, int reg)
> +{
> +	sdhci_writel(host, sdhci_readl(host, reg) | val, reg);
> +}
> +
> +static inline void spacemit_sdhci_clrbits(struct sdhci_host *host, u32 val, int reg)
> +{
> +	sdhci_writel(host, sdhci_readl(host, reg) & ~val, reg);
> +}
> +

This too, just open-code this function in the two places it's used.

> +static inline void spacemit_sdhci_clrsetbits(struct sdhci_host *host, u32 clr, u32 set, int reg)
> +{
> +	u32 val = sdhci_readl(host, reg);
> +
> +	val = (val & ~clr) | set;
> +	sdhci_writel(host, val, reg);
> +}
> +
> +static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
> +{
> +	struct platform_device *pdev;
> +

. . .

> +	udelay(5);
> +
> +	spacemit_sdhci_setbits(host, PHY_FUNC_EN | PHY_PLL_LOCK, SDHC_PHY_CTRL_REG);
> +}
> +

I don't feel as strongly about this, but...

Here too, what the next function does is very typical and all
of it could go in the probe function.  I do understand that it
groups the clock-related code though.

But aside from that, I think assigning pltfm_host->clock could
be done in the probe function rather than hiding it in here.

> +static inline int spacemit_sdhci_get_clocks(struct device *dev,
> +					    struct sdhci_pltfm_host *pltfm_host)
> +{
> +	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
> +
> +	sdhst->clk_core = devm_clk_get_enabled(dev, "core");
> +	if (IS_ERR(sdhst->clk_core))
> +		return -EINVAL;
> +
> +	sdhst->clk_io = devm_clk_get_enabled(dev, "io");
> +	if (IS_ERR(sdhst->clk_io))
> +		return -EINVAL;
> +
> +	pltfm_host->clk = sdhst->clk_io;
> +
> +	return 0;
> +}
> +
> +static const struct sdhci_ops spacemit_sdhci_ops = {
> +	.get_max_clock		= spacemit_sdhci_clk_get_max_clock,
> +	.reset			= spacemit_sdhci_reset,
> +	.set_bus_width		= sdhci_set_bus_width,
> +	.set_clock		= spacemit_sdhci_set_clock,
> +	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
> +};
> +

I think you should make the next structure be used as platform
data for "spacemit,k1-sdhci", rather than just a global.  That
way you could conceivably use the same driver with slightly
different (or even the same) quirks for future hardware.

					-Alex

> +static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
> +	.ops = &spacemit_sdhci_ops,
> +	.quirks = SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK |
> +		  SDHCI_QUIRK_NO_ENDATTR_IN_NOPDESC |
> +		  SDHCI_QUIRK_32BIT_ADMA_SIZE |
> +		  SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> +		  SDHCI_QUIRK_BROKEN_CARD_DETECTION |
> +		  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
> +	.quirks2 = SDHCI_QUIRK2_BROKEN_64_BIT_DMA |
> +		   SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +};
> +. . .
