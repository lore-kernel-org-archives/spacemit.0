Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035823;
	b=S29y3bAdIA7+nT9FzcYqU6KIT6wHoVaYcy9W5wfZEDZKeTWrF39v2LZUVnsnlkzqM3T4
	 HPiQdBAatZgkY1GAKjsu9R6mHmpHV5RfCJi36U5T0RIIYwSy+Cm8dZe1pDm8/W1XrgZEk
	 p2/lHVG/M8Av9HutQOT8ryfyMSqIvrIBT3KN4eZNJ1n9o1dLXpjhwyQe0dWHY25Qeg7RU
	 wVE22FwaohSNV3TLVoQU3tupla0d+E/XjwmPoF1XQ1cCFxLL9D635XNptp14GeE4dGT0N
	 SgQ6j7sq9F4r8s/3hkO4IvCUPJ/s7bABuCex8iPUBOmEA9QL0XWimasArQ9edDoW+5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
	b=eOuwkjV3M4tPcmKNAvGhONY5FHO3bo3cdqb5S7kKQYqMk7qO3ja8u32yaWqmP0/akdKz
	 yL4/20h9K7h6yFUioo65ifL3xcO6Scz/dfCmSkoUCQkQy+u1lC0O02OCeZqPVh+HCuoSh
	 gjqWZQg8h+mbfm8PNsWniT/T6TfkeOIS26qSQxmukXvO7muSBAkcxQlBZpMBTHopc67oT
	 Il3b01WeZLpiNl1FKfmGKpNa2afv9bKsrI0hoRV3ev301Sy88fj6GPS9h4zSSOIlNMHFN
	 5po1dSO+nXQWoqh8XcLnR1YuzTEpnqaKTBFhf+OzNUZG6Djd+Tmqti2S7WOBEBhLzDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkPkH6XH;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9552E606A32C
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9552E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkPkH6XH
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so285043a91.0
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035823; x=1795640623; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=CkPkH6XH+Mxt/PRVIXTN2EUQnnyO2wRQCdQgs8ekMGKHDt7Chw8ILYkuSIzE3DdF99
         vEdmi/V0PvGyUz56w4R+LkjiyZC3xD36A48PJy4vyGaeUXUwwpG910vtZFOb7BZsxpem
         F+N2Un+UgRDLzCC9PJHYwuRpteaYeldEreAh7qD4xySPRwil6NL1YHDf0PSXQGlCqi+0
         gOBx09s1AKz+LlMslI8JVJNLG20m48+Zglhr54Vl9olUZKIoGbYT9pHE2qrmX9VSNrzr
         lcmm4cSxu8nM9A8qQ2LrgE1lzTCKy9MdY6gcCmWN3Sc8MUUguzARFweou/NCY0apcpFp
         U/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035823; x=1795640623;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=OxBjd8393dqHUAJGrW3Nou7BHoPDt5Xr9Wss2F7qlxtNcUOM3s0o33MnlGreZjAozU
         xOCtYAwPr/LPDnvb7yVpJyMa96Ek+s37U+Nt5n31tShUyxja/FrU1y5xd6knUeRYmOes
         4QF8ycuI9Fm17HV/s5h6btdNbNLahOTo0fYa7l7LPYN9+etJ69aBqhV0oB5ZKirH5Jor
         Mm0JKRy5b4SJhGyPQ0AnUF/yw1OdIN4kWLr9yDDJw7zR/rW7L5JCmbusbU6IAQzBwCO9
         /UG1ZVnitwh1f4FeJp2RROJj8r0eB93tOEQ8zgGzgdJQOOgjEf70GUO0bdQZB0uLglaA
         FKZg==
X-Forwarded-Encrypted: i=1; AL+hErFt2U1s5pOHn00+D37E2AKWVJ3FRpe7SGniw1hitxhHW4y+oa3PoiXkjX8XtcPZS1IXc8uKjA0Vpg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8/bAvRJJRm5h8mUX25C5RFv02OccKmqLQmhUIBOh8QCFdIMLnH
	BziwXxFOAHWpO2jrPqyqkD4AHUgEOYt27VTmq7wyYVy4CXjankm/1hWS
X-Gm-Gg: AZFdTZdEGjnJb0OVpLTrjVEir/8Dr/4uRFwS5UwCMB/Ifm2Yq2zUhD2RQ9KrJie8+pw
	GuYGNij2w5zWZppZKjDep3PU9ynED3pDGQ2TUX+p7BVsEIbnsE0eSyuttsPJKeyvPfEO15xdEmI
	lWJnSKjcrSVkoxlT6M9DVSAof/ySgX8BS81feKFvGdXXfMr65QqhxgLeyKl/dw29B1TFYq0JcDV
	+rLva69VTNECyMbajWc86EmNctb5VsiCtojjo7q3JLgYccpJR6z/juHiV5HdR/RtMeZkVwdc/0q
	/hOitWWJbmS/iNnzWsntPfi11AxTMmTTnHcAazRPH1JJe41SscMopE8Ry5w52isO2WqC5YUwNqz
	xVVcQkBVRWpkT/OUyOaFhFRcwxiDMh9praLhxFZWZU8ue9UNPeWTUAkMOPCF8559cvInXP3dZQT
	FEh+GRv+ZkLB5zvbbvCmRODkfikrSL7R11ZSoe52x4xQTlQedSEcNyX7Y8B2aMDMapsTL2xUgE9
	4EzypRTzPMmctO4/AgWyns8IITWopWjlnu88fU9OjEdgiLhNXZrpf5S8HEQjJ6H+UQFuYuX+OKg
	Dos=
X-Received: by 2002:a17:90b:3c81:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b3d07aa355mr3694363a91.25.1795035822845;
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f7066ef3sm865257a91.11.2026.11.18.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Date: Thu, 19 Nov 2026 05:03:36 +0800
Message-ID: <5167ad548a578a23ed8d5172196b36f0.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 08/17] drm/spacemit: add Saturn DPU core types, cmdlist
 and display MMU
In-Reply-To: <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-8-327d7910bf71@gmail.com>
 <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
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

Hi Thomas,

On Mon, 14 Sep 2026 16:10:25 +0200, Thomas Zimmermann wrote:
> Hi
>
> Am 09.08.26 um 15:14 schrieb Cody Kang via B4 Relay:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Register programming of the Saturn DPU is batched: the driver builds
> > per-module register lists in memory and the hardware command-list
> > engine replays them at frame boundaries, while scanout buffers are
> > mapped through the DPU's private address translation unit (DMMU)
> > rather than scanned out by physical address.
>
> I've looked through the code in patch 10. How does a plane interact with 
> the hardware? It apparently has its own command list, but there's mostly 
> code for the CRTC update.

Thanks for the review. A plane programs the hardware through a
command list. Its atomic_update fills the list with the registers of
the plane's read channel, the driver points the command-list engine
at it, and the hardware replays it once the driver raises
config-ready.

In v2 the plane only fills its list; sorting the lists and handing
them to the engine is done in the CRTC update, which is why most of
the code is there. v3 will move that into the plane: each plane
builds and submits its own list in atomic_update, and the CRTC flush
only submits its own list, for the composer, and raises config-ready.

Cody
