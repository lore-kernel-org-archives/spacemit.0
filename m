Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486342;
	b=TXfi8jFNcfdzoc3lO05wy1XBASZok7jIHauvgGiPp2FXRY3hDN4Sqo3/HJSvY1KDUeIO
	 lBy0PmEDSP/PpEK9+gj4OeHlS3srDVM9qC6GjFBgkdebvaZBpCb8gvtofhRE+rhELc6VO
	 R3HZoT86JPd9tsv8NNEAy74twe5Vsiju8l004KewMu/d56Nfh/7xTyiy63GX2ABX0ovfJ
	 VGnOGLLBUdpip2rXUaGLw2EMRDnyfIQnc+Yc/p3pQeOufzEkYLfFeu6lFzI2gQ1oM4nva
	 PUYt0XyI1odshxR392pyYIE5a4RwEsdd5PHyh3ewmHO8VJdqGZ3mTyZVKVHXFpGI/wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
	b=5dNYghIjMQADYxfzzD5TuMCYGi8N6cueLiyFNH7SRg925OGIwUiV8NZZVRHTCovcUYHv
	 O2K2aDbc635imS1dkc8z7poma65vOukinnEGeXSeiE2i/wKF7qoF/ofXsS15ckTSI4/vD
	 KfH0LmR7iDqHhI/FedYy9Pr8LwoUDwLrhs1oLw7jNXu850+jYnN1tSWO0a1cobKCHHS/T
	 yAVDOKMQNIQDV9hfG6qsFD/DLkT9VIMORrsILiu2suDkgkvkvMeiycdB4nICBp++WgC/q
	 6vsbztqKyT8N+/xM93AobZX8Vi5cOkCQUJuewpVHvXLE7yfId8QImEWJG/aEeotRzYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClSwIla6;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30259606A31E
	for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 02:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30259606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClSwIla6
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3d125637aso777423a91.0
        for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 18:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486341; x=1796091141; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=ClSwIla65bX6YI8Z67IeI2qH+bvKC9dY5oJrtjvbu3S81QHCDJTmx258TMwl4c56Nx
         L4Q9phTGTbTASMUdt0fVgslrcj+9rRMSG3DkJ+8GszN2JjN2rxQrFMo4/BY+XoHkIYdd
         VCzlTnWBm33SZUiNEQhHV80/qOFYbLEXvSp0ENFGO42IFY4A8JqTX2E/ObK2jSK7bggR
         FfripI6hrNbj5VuAfCnMuD47rDBr/gmxJVMTF9OqyXLaWZK9FCfkQPHXfao7cj6bmD0F
         AXnGVGSc8Y3W554cNxgQFfz1a7VX57WJvjLLLVO88BJ9xU3k6K3VrMKmz/C0/1pBomAl
         COHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486341; x=1796091141;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=jDRoZnaFswC+vpEMmnEhC+yxlcLQbT5x0OvItUWoMOzvFQtp9/GculysdhEcOIAKmE
         24frEvdScbZ9O5XyAAUdWREdtG2cKHiYnNdO9KjE5Ug2CMIBPBh3F92wkl2maEV7iWh0
         DxjFerf2lo7CP9Dw925z8X/22A8CgPODaX8xM75ZGfewi80yGPee+G618fYflX5opeVH
         l252/+uQ0RLqAIClXdARPBEWUGTzhAtUk3205+xadwMK4atTpgbQeuIwDw3EyXKaWmAE
         z3sDvgWot9z2U1DDEYJdeI8fn4VDix1RcomZ5EZYVS0b+qgsvQREeiQHyUvGBEWil9Kw
         2Ufw==
X-Forwarded-Encrypted: i=1; AL+hErGMD/Wm8L1iCg3MFuz828llKXkcl0qryf4s+xgmP90qJuQQ0U+HE12j1tN2m5/s4rCEf92GDMdRUw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8nfl6Z84PjiZzEPsqBKTXUyV36t65FsK1Uazej1qXmVW0/iSzR
	29piDQlOuyC440uGb6wfaTf1slbJA2CuHDuYPUdRTOCYmpPiCJX7+eyt
X-Gm-Gg: AZFdTZczIWwLleRZsX/glV4wXisLcRpOhIczZjTTD8Nmv99yrGnYLVu8B03V5Cgjse2
	ELlXq9kVnsFmaq5k94C36noLiJ4ajtgpusXGnSEPs3mJFd3bWuvNvZFMoxS39YNv+mE6xWYtewi
	gmK1jhA4pZvrw0A3nJP0yp+AiGTpQB8oVQoUY5dQly/zMRgv+HeQmCfkW0J5+dxjtnKDEPO7xex
	oPv5N2r3DjYVE/OsUJfj8h+Sjc1DQVo0b+B7M0Lzwit4wiEs46sfJzglfYyVl0N3Zf2Zeg7epcS
	SKVWa3/R/MRx5oT1RFl0ix+QjCmYe9oWhnaYsY0Bww+3xL3WRn0RvtOX/7p1InHMRdpKKC/bBnj
	f9kbi3bouynv27EtPzFUaBOwfJFKfwvhhi0ZOuyJPUrMrJS+uzZSTUJxfxZvEfeinoXHhePed8E
	vASRkS1FuDtBZCi8Poo1bX51lb3Nm4S3ZtR5At7A9iQ+tYGsMR+mAeGWOGrV84yQx9MyGFqPSiH
	XANBe3ccVLxneKBiSfuOq4+HmtSTnDPfaYDhlP7TA5xW+m/IrZADE6SSLQjaNlRTT83w/pt6lMr
	uoOM9flNaymyru2SObGumx+rIKZb5XPUGe9K8sY+GB30DDKcKrjP7XzMRg==
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b41c9476d3mr12780728a91.37.1795486341377;
        Mon, 23 Nov 2026 18:12:21 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm9869004a91.9.2026.11.23.18.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:12:19 -0800 (PST)
Date: Tue, 24 Nov 2026 10:12:15 +0800
Message-ID: <3b4d214b53b64cd7941260875bbc88d7.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Ze Huang <ze.huang@oss.qualcomm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
In-Reply-To: <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Ze,

On Mon, 23 Nov 2026 22:59:10 +0800, Ze Huang wrote:
> Thanks for v3. I tested the series based on v7.4-rc1 on the K3 Pico-ITX
> with an external DisplayPort monitor.
>
> Modesetting and page flipping with modetest work at 1920x1080@144Hz,
> and kmscube renders correctly using Mesa softpipe.
>
> Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

Thanks for testing v3.

Cody
