Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729482;
	b=HD89FuAvPLFvOdMTCjCYM7VBmWr3oabP3gY4f/UvfD2X5JVh7G35x2J3k15HXkm1HbgO
	 ZstLFVhSzSvmMFy/HdAT4RtTsRguKjzY46k2OW027G0xAqrs8eCYaLvoOW4gS+JlsRVFa
	 hkeKrlEY9dmZgS/n9Upo98mERGOqq4EEdzs/dR9/05BCg1RM9vPrV+269RV3pZGgH+O9m
	 /s2jiIiTNEKGew9XVvaeaOteBrUlzbZjkMaARqkYl0s0/I79pGOYbZz7XfctVtrn/h0n7
	 StmF0oNMLnvCspr6wWWKD8GoNst4Y5iMHzVudxjqILa7Fvjuezt6JS+278VRaMU8w2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
	b=mBHgaNhiibRNjLSyonXJjmykyzLqYTltZncL5C37bq+68aX16F0W4JARMju4pMssiG23
	 hs7MIpS3fZxyrWECgJ4fWMp42XtAyHpEsCUvvvsUd1x07IhdcYwa0b60bf+ujxpSqsbr7
	 wgLzAv68SmywT9O2kPbmfZKQ7mP3xZNGoSPYq020atcQgCFmTpEa1B2TOTv6OFZV78EUl
	 mRRlWl9Vseg5MF6ZoZa6zQhSHVKitCuvgzYg7W9IWnADBDrTGQnPzBPkgxCaW0aeWiFLM
	 hACX1tVfKzZYzmPlUKhUwmPIfPEU2n8xEgNqRmJxmTS0aPWmPuORmEImlZDeWE2Imjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCJOTmVr;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AFF606A6BD
	for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58AFF606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCJOTmVr
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1527376eec.1
        for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729481; x=1796334281; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=wCJOTmVrf9s5CAI6ER7XneIJgi0XNoXRb7Ejv+3jV14QyhArYuIINb0JaTAsQq/4Xt
         ZamFKa1taSks2+Hgcu7cf0VdXxVKoZDtqWcB9WZzfg4Z4++7RHOcPOeEGQSRyrA4aWUq
         aB6qu4m4RoKLC+w21VXy6sbRhatmIgSp8C9ooT9KaamsJBdVoTh9pLd5iEFKdpfIn+oq
         rHcSS2finFTyRtMRvARXo9yFy1w9K8CUwW+wC8xCUomdQbE0S6zcutsOmEpMdfz5X61C
         /Bfc0R7ksbcLwES+G6N+vmotBgZnCd1fSEz2gNHF7yxEKjUoYpxJhSRavOzoI1mBVDOT
         oFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729481; x=1796334281;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=pQkBFDVRl3CnbWpU7bgbexjASLR3mTiMdP+h8Ndxd0uBjKOQYonwqATRW5v8xclY2L
         JD9Oasw0ZwSWFg0Ilsner6seNDZhLQAW21Y4OVKO1vr1OZxjRerFm1XApTIe6XRZ5amU
         p0cwjd9iau4l8BuEeRFK2+Ihb+48MlHic9Vnf6Dm6R26CT2UUDHCEht9R4XNtNtDZEDF
         Bn+3oYoCfQEeBqgww/RKU1JzK2+fHBuVCyfIb8gKdRQgurMVfVEu7yFZPa1y/Ls0enXM
         ZMPw4tKrVGyv4gHbYu5ZmlrNyh07hFMBByJc6qA3BVyACOlqedfhn22hgoQTp4bndtUc
         F2Bg==
X-Forwarded-Encrypted: i=1; AL+hErFcmhqsuaZs43QmjHz3TQmQdOBP6vzEHakr5HI8kptVehwB6L56Lz8fh2LjxJ6e5eJvQ1V6AHzPig==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MhU+DgfyfFLZwiBaG+OHvOMrjNyeEUAlVS/x4elZkVjz6woy3
	FcCANZ/56aa22hdO71UQdQ7Uc9uUvDDb4jme3+ndH7jb+rMm/ET9WB0Q
X-Gm-Gg: AZFdTZe6No4zk1ydokN5Tj9vo4mCb6Y40nro+/FOW5mSquqd21TGzWS+usAGaiP+39U
	k7hRZQzjovbympoLxbJob45rkYUD/DAfcKu8p8r8QsMryLa+pJTbByWZ+hVb3pQbW8Nzs0BzOd8
	8eN33AEG/L4vGGnb2wmRg69dLD4hvfZUAPT6FERF6Tp/aWFTfur+m+f03/lONM8tprSZ9kpneoO
	9xzZFsPeSg17Zw7nK9JTIV+tZW1pIRzB8c1dm+qndB+0/PLJQp5aIUJDWp90JTU4JsckIWZW94T
	EjMONo/9FgqwIyhJ9ch4nq1yMXdcYSuBBeq/OaVkG2+dxVU/3B9/GBzkL1QKuc37V5y4FnDo//O
	tHOFL1dt0RxMqFXzOayin2T25ejLoZVva2k1nXMFts9frnjmUaxDqQXnd5LZHh1KxTqyD7d8W9+
	8LeJCmSsfPhKkOZFPR/EKE9hAWsd0ptna5NcuKTfQOnSPjwKkMN3Ly0mTEaXPPZ4F1lfImpHPCD
	5DbM7cZuUpK0ilRp0bZSrBXDSiEBGdFRA3a1RUX/2BremfKylr0QyJ54L1nV0U5XKTi7715I5Se
	nUZTQbpuohflGvl8deXfKNQviIqGwAv9JnzOt4M1wNC7WkOv6x1ORJT+waaZ5rM=
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr21960944eec.20.1795729481384;
        Thu, 26 Nov 2026 13:44:41 -0800 (PST)
Received: from localhost ([2604:a840:3:1e0::1080])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm79578155eec.4.2026.11.26.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:40 -0800 (PST)
Date: Fri, 27 Nov 2026 05:44:37 +0800
Message-ID: <73f6ebde526f60ff64064ef602e0cae9.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
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
 Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Cody Kang <codykang@vsit.ai>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/17] drm/spacemit: add Innosilicon DP/eDP controller
 bridge driver
In-Reply-To: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
 <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
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

On Wed, 25 Nov 2026 20:16:25 -0500, Guodong Xu wrote:
[...]
> I noticed a corner case when testing module unload on v3.
> spacemit_inno_dp can be removed while a process still has cardN open
> (say Xorg or kmscube is running and somebody does rmmod
> spacemit_inno_dp), and the DRM device then still holds references on
> the bridge. When that process closes cardN later, the kernel oopses. On
> a CoM260-IFX:
>
> 	sleep 20 < /dev/dri/card0 &
> 	rmmod spacemit_inno_dp

Thanks for reporting this. I can reproduce it.

[...]
> Other DRM drivers with the same structure, rockchipdrm for example,
> put the bridge driver and the DRM driver into one module. I think doing
> the same here (add spacemit_inno_dp.o to spacemit-drm) is the better
> solution.

Agreed. Will fix in v4.

Cody
