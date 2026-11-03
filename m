Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706838;
	b=Sgr3GNC6tkIb3Kxhii8hDKg6PPinWvMnvUH29Mveap1iB0JRnxolReaPMHe/rYYWSZC+
	 Nwpj3wODec6FkC0cAmmytME2OM6fQPKzyuW/blQ41uzBfXgl+7p0p4n4n1T6plHgbmOH4
	 2bZfRuQiKH4UMWHoIYVyrq1X57ZBXv8pQJi9eNE/pnMUMibiDrLU88wRQNiP52+yzgli/
	 BAolOduByGcSwAbFTY382tlpwmvR2tb3CARDi1Z6NnTLkRIRbH19xSZ4R9+TjCK9KLc8M
	 B5dCYp+xNt/1AjqFQ4NRYsqiNl/JqOhCdnhQlheJbB2LpQM+HvSa1eK/Y9rNvNTsBUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
	b=jF0Sy+9r//BA0u2S5QvqOGfU0x8E4emU2nnQmIENNwXOQsCcHjq6rRnttlfWjjVUwxXi
	 QrXsTnH/0Oc2PYChaP7+K4D96fMXfir8FbDss34U9ZOZRQehUyXVsQwV5QfnV86k0USWL
	 jyGo9ElByWx0VF9hu+vekF06sp2S0nL58ZSmXzP1Pe5Rmr84ZYZKzFNf3J5fPKZGBaM1g
	 B+4T3vhXBGBinN2bNKY4GFst2cpKgd3laXdcB0ba9LzlJlOzqq+eOQcfk8Zg7Dne6icMC
	 ZPJ5SlgomQTMO4kc+1nEOvtpxeZLBFuTeqYilrU2IKS8fnOUg6nw+xTdF4SoMM2/zow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjbEXUjL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45140606D806
	for <spacemit@lists.linux.dev>; Tue,  3 Nov 2026 11:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45140606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjbEXUjL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAULt2201872
	for <spacemit@lists.linux.dev>; Tue, 3 Nov 2026 11:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=; b=MWWjy+ZVi2QdM7hV
	mqTyO4PsXxS1DeaTU7F0pAhk8eTinZvdhnDH3UY2nWUpcmotKOOoNSkfFYno6zvP
	REV6ABDEPV1Mi6FxJu8o8aHXxbGZ4bqB5mDrgZsk6oUaMDz/uw8uPELXjz6h/pe9
	XHsfsSXDnizijPjlIkO1rH/9HbhyfxvkHInASLwANmxINNEuUt1A8Iq3uXhv8gzD
	jtrLtrSdpmgIjQyTpzH4p2jGLgzKVv405S9fxEOkSFBSK17afQ5ypntnmcE+zZde
	OxDAZWtoPjUvNfQ/RumMUqU3vTm1o3B2J1r3WtcAYbHiubHCK8T8v5pdvCyKmcS2
	dVepVA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3jyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 03 Nov 2026 11:53:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2385377a12.0
        for <spacemit@lists.linux.dev>; Tue, 03 Nov 2026 03:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706835; x=1794311635; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=jjbEXUjL1is5FQDKVlzuOSnvK2q38HncBLyffjC9UL8X/f8soOwB+SfJaScq92bo5U
         S3xPr9HwyFh8Aztrv7lSHirjEnckLrRlMP8ZejFm9ES9cnerBrikSzj3qBRZKhvBWp1A
         0B9Df7EP9yzn3oC02ovs05GlIZTe2cf00BjGcNyfZpnG41gTGylTClJhrCn5dP0/VJ/a
         q1W9CnP0ROI9I441a3+CErUlFlSMIhKItuW/dikg+PaFpOmXX6fbhq8LlrJ/tuZp+bUz
         fvlD/uSR8tCZAu8smLwdENGeNm3JkvLugMuiJTuXTyUgWYnZAbzNd5ABxGU/eqgLFK1E
         wd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706835; x=1794311635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=lnImL+chl6LMjhWZQ0lHee2djlHjqBHAmYBm+AIaR0fTSTEbuUWHTv7rpdm6yaKQjO
         dwMyWQVyjeqnPJe02fCQZsdAuiR7fxYW6Y0D9BSvUkHkYaMdY4vQgRGw1xEPA3NpvQC4
         G3MDmL7cTMLg/ROYKpAL1UfCQBGsVlI5s74auJwyz/jOATSKabIF2Muruu1+q9jPfoGQ
         1ifG4HTGbOvserxDZh2g+fmINK4aEefa8v+KTBD7IzCo6i+cXP6eiXSWo/auG6msjks8
         KfuX78kcJhar9FI/FHWN5x8LXzVUU96idx1zrRko3bL82pbcOWBy+rhdM5/jT41BNPdl
         sH4A==
X-Forwarded-Encrypted: i=1; AKwUvByVNj4vmE0J2zArH+OK9YTc/he6rgKQ+B59+cK8/s6H+N3a8d94p4PELR7vvMnQt6ZTaB6rGe/ZHQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Lhr4dTJhScB9XJiKx837l4Zo87sQXH3q9ib0cd1G06MS1gXgW
	V5gY0m3oCe/lGQZv8Q+MQtFwdvNAz28k5i+hY/BZKD9JGb6gq8kPb3AgW/AjkILzPqQWeHehbVl
	07yygNeIvk2u6RB02cMQFKAIoALSsemACqmNykQZBIrE7YtvY23H+OnmynFMnoQ==
X-Gm-Gg: AYBFou0UKcK4yYb5u5QzTSl8XiHPPqKTj6TrlfHjkWDEue3mcOsNF+0E/76/XFHEYY6
	LMbcZ4yjdi7QMr2UAsk5P6+J5s5DzdZJsr5fWbHaiB5rgRLPj4hTl6KFR22klqcqcGy9zNBbdnU
	Bty3t6aN7wMLze25c9MdQu5W6T+drGJFazJi+2214FzuOKWJf/tcTLd2XAUQqn3yaE0Lun5M0lS
	kwV4fwUzDcJDI46n6tqEZ97IxyxtJECHBHjHNYtVbCHNQkwfVHoj2OsL+rokMtA7GMv9q/xU5lJ
	KWows7UlidmaaA/6J7cdGSZHmieva+vsJrT3asQ7Os73BmETC06K/K6+1O/JbYxLzowZDC6NNqs
	0Km06+I/+oAKSGhPKGLUPjeWfXhMBqUkwW8dMmliHtYdAnBm4IWWGEz1AKWMSKVYHEAXEM3C+K9
	93Y79cXA==
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480954637.79.1793706834840;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480885637.79.1793706834326;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364cb511sm1161045a12.28.2026.11.03.03.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:53:53 -0800 (PST)
Message-ID: <7a873a59-247f-4e4d-ad30-32bb504da40d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:23:34 +0530
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
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
        Ryan Wanner <ryan.wanner@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Vladimir Oltean
 <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
        Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
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
Cc: vkoul@kernel.org
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C36OTrS-t8QsNBzdzOA-hm24J-NY3Q7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfX1LYNDstz4TQD
 P9rx7EDLW6JZvBfaSyq07QrsM3l18bpMhil1NN5o86j/iJ1/FOrTw5S9ZGSo0yQkx5KTLty9D7j
 eQiC/8oYLjcj2uGSrwIE6K8MdheraokLsE35uD0F/8rzA+d0kyh417cuVPGORwr+TT4YdN+80Ph
 +jk7U2+m+8SvQflsu8GQyy8jK8wUXyo35OOXhi4VDHTxwK6qm+opdBC3cvTYMbFz/yfkfksBf2C
 dX44eJZEo1BF6/EhX+ObGfeese0RmlNQfT7LdJD7e9PQPkL/GBCMIC0EA5gQKvofgwHVsueJ9FQ
 sT5oe1bOBfAK4q/XCYuYecMmaneottptnp8geDRyVFEKM+u/vRwYo2rZVznpc0wPrQrrx4S+5hM
 KT8zW2wtICjwQH3MlBiAtyTXemEOjAfzky88Xi9550dyyww0rx8VRMAuTWrEDfVHjci/FXbL1ff
 22Yw9Z1zoAX+XVfWHqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfXyiEKOKt0l+s1
 l+/k0gYiY/Tq1pdN/TBM4J7T8sTYYOd8uEHjMtfekl5LmMlNVlylCI2+rerSHszQ1DnH2HoIkc3
 8eKz/MVE/7CW1g8VaTJgpXjsRCdIxHk=
X-Proofpoint-GUID: C36OTrS-t8QsNBzdzOA-hm24J-NY3Q7h
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9cb54 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030047



On 11/2/2026 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
