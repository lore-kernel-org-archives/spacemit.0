Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816353;
	b=UvVZNK6YX/qXxGoSJAZSSLXoeq8McGZ4uUXgw3oDyqsVfrGAVVQqegiJtHFkA68zZYuF
	 RPDhRCYtqA3fy8AV6s8kiG+soDrKRRJGrdq66PKiKYiQ8XTyKTfxlUIyfnTeSe1E1lRDE
	 QcbFjjLDrVR1X3Aw1N90xePKM9Pf0BeEn+Q60s3HVfDIfKUcGaPVLs5oYiCBMOfuSqqXb
	 38rAgjKAMFmfUfi4oaGehekNPYrtvOGyfEYOs6DCP2PN8X/JlY0tsXcIqFaIhn4RJeDBQ
	 9nrNHFIaEal50FoQyzGYr2a1SgKq1V4mDvOiL6XcSJioZRYmbZxTHHgWGR5DoS4VwZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816353;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=FlQwGt9vsgmEqVOXecfnOUjERz/PPFh4Xv6/vyt/054=;
	b=RQImyrc3Rz/ZAZFvXZO+fbm2G5QwkiFrTn8ZbSpbRYA7JEINVOF57VamGWUfq8LbW/Fs
	 SaW4kvYTMZXptxKz4qOgXe2LyLx2/FOYt7kJ7+U4uEHGWKCY0CednMPf++5YTbE6v2Mv4
	 ZM2shoVz7o/WNSh25/1uDMh3bp/BUGKulP4sE3dvOjGmOAirjQXDCiwbEY4wFU8gQ8Wda
	 Y0MD8muoje8LYr5ddURg8cT5bqPsr2mSjjsNKbtNmOtxjmF1udyKy3FX1c1zRrwwcaCsB
	 srDdBIRnGPN3l23+FYZTSMPWFuIxgL1wSKNJK0URk5xLZDQP6uqagOMhYFTduWUZ0PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FKkN6PLL;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080F606A32E
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 18:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9080F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FKkN6PLL
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-36c9a93a1abso937372eec.1
        for <spacemit@lists.linux.dev>; Wed, 04 Nov 2026 10:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816352; x=1794421152;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FlQwGt9vsgmEqVOXecfnOUjERz/PPFh4Xv6/vyt/054=;
        b=UGajtBzSd8IWBEFzK32dXdbvio8dytBYWLsXArZgC7ReJGtetvMMRs9dpkk9flNwtq
         RG+Ze4gxh0L1Kj45b3/Y3xd5+RgaRgXkTeoZy5zmyIGVoCltxqMs95fHpHpnM9SvS7Cf
         tH8h5HiIBHoqhkMdzKBsmMmRviK4eb3Z7xDpM4WQcKRPVmF2aVKRDP+YV7VeH1ffwuF7
         oPL4+VmWORuw0bbQwaZ7fKDQZCuMM5l1WeTfL7RYJOYxBKIE9456jcAgPjzCvXN17+Px
         J1qZhKKvuf7xjIfl9mOIX+10m2K4c5jilXTCUhT4TdYlsRFp78hmXTskonopIjyNv9cP
         +iZw==
X-Forwarded-Encrypted: i=1; AKwUvBypQBcbUHTyYu9GbxpIXUyGRld/SOtKj3n4p/n82Kf35DE4MXsIdhLriC/L0z+Z41+NQVFENgM5Tw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9sKa8AnZ2s9gH5JmTFV+aLbjI5XfzVIwLDikHpedJoMdU2rIYA
	LwwGYycDAlgqmcMjxL3di0La2MpO5Nrchc51uPz1oAg74t2jOSTHlfjoEhNahmWM+qxKIRbHM+p
	pz2WOe0rCqeFLg8wPyrtdZbBsndbbrtMvS5a0ONQp9itOmy/kqkEjVZA4z0EvAl20a7tsTGyBJ9
	e8wFfAmkuimq4E6xizPJwAEwji4ahrjvca0WvsRIKY9K+XTEkKbzc+vERnG/Fc06kARd6LhpZQD
	ttB6sELq7AonirxAfMGCA==
X-Gm-Gg: AYBFou3QV4XkK4DE+KjG29aYybrDIguc5a/Kkjc94eZ/EWLnkZYXOSdblZwdSHO1936
	zgVVZgrKeX4HVB+bcj+BatMUz9sQwYUBMoZhUAMYUskfpOsR9CaZmzSeUn18ai3i0v7nHnZOefj
	1WcmmOjGWUoUCMFtNw5FatRoDAOQa7duv3YFzkUTyxVgerZ/j6njsPOBLzqFxFFzKb73REriPUu
	GFPpNBIKAac2ZXffphu0tuGA6CUxHJMd+W01iB+PfaJKkHenzy+4izQdp/4A8EdlGn3rDNJTO+w
	HYLog9CXUn1J/zhWvFhk5tOumrwW4YjXdYn8380+KkcbRrwczNjgHRG6EKTf66bd2WA4LIVGhhH
	fqjRwWRIe8Ff25oLOvvhZs1zZa/C2vcrluz79UdimqLklrc0JXbOp/H+Ds4lMarKHRyVx1pyg/0
	/gzYWE567p4H6D8g3M11xnKDYwCRnj1UGIv5RV8vJV
X-Received: by 2002:a05:693c:4195:20b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-36de666bb67mr359219eec.13.1793816351095;
        Wed, 04 Nov 2026 10:19:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-36ca3930f11sm31002eec.19.2026.11.04.10.19.10
        for <spacemit@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:19:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c6c1e082bso34226796d6.0
        for <spacemit@lists.linux.dev>; Wed, 04 Nov 2026 10:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816349; x=1794421149; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlQwGt9vsgmEqVOXecfnOUjERz/PPFh4Xv6/vyt/054=;
        b=FKkN6PLLXj0yEW6SQgo/U0NRT/2BdEhu6YJMWjHLqNhRE4b9Le75CxM4bHJyHWhzfg
         97xgr7x+kpQ31z+07Hmmq3oukmmslPdCgBHEv5Jrd4Cw8QQRrQRSerC4QGDZGaizeUVS
         x3cyNWGGAkevLQ7aLc7X6Ay3SXT682VLZUNLo=
X-Forwarded-Encrypted: i=1; AKwUvBztK7zFBrWGOwE4clRvWysX8yb+JDWHaeXeapyCGm/2UAJ/RUoa5XEU+VaIcFdYj4pjGZMOy7wGDg==@lists.linux.dev
X-Received: by 2002:a05:6214:310f:b0:917:aad9:de05 with SMTP id 6a1803df08f44-91e9445105fmr6406876d6.12.1793816349427;
        Wed, 04 Nov 2026 10:19:09 -0800 (PST)
X-Received: by 2002:a05:6214:310f:b0:917:aad9:de05 with SMTP id 6a1803df08f44-91e9445105fmr6406096d6.12.1793816348885;
        Wed, 04 Nov 2026 10:19:08 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e013a5dsm25545756d6.27.2026.11.04.10.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:19:08 -0800 (PST)
Message-ID: <2388e81a-424d-4263-a111-75d0f87c9754@broadcom.com>
Date: Wed, 4 Nov 2026 10:18:57 -0800
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
 Ryan Wanner <ryan.wanner@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean
 <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Laxman Dewangan
 <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:RENESAS RZ/V2H(P) RSPI DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Thierry Reding <treding@nvidia.com>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/4/2026 7:22 AM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *
> ---
>   drivers/spi/atmel-quadspi.c       | 3 +--
>   drivers/spi/spi-at91-usart.c      | 3 +--
>   drivers/spi/spi-atcspi200.c       | 3 +--
>   drivers/spi/spi-atmel.c           | 3 +--
>   drivers/spi/spi-bcm2835.c         | 6 ++----

For the above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

