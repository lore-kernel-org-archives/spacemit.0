Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371195;
	b=kaUzBJp8v+JYXuaiSi7dTOYm9qTvkRBHhwT9IQVkNdQS6Fi+RLX6v1FewSy0iC7Rp+L8
	 HSbpNzsG0nljVq/+IVrEmL/0eizlRohevYyXHek3LsCCXzHW49FHCLOyzTTAsTSDa+CDC
	 nFii4eBg6I9u9PkJGJ8Q4KYzzXBZcIzwpG1LNr1me0TmraqnW1UACyLfGd8tjWcZuP8+/
	 HoVOuJnjTaM0Q7d5bbZlmiRW6cMGu9RTVDTmgJrlw8EVCxJjwXOk7Up9vNynf+EInz0yM
	 K9HJT0sY0yO+7bez8qNplAS8i/8gOHWk2ZHuvu9zvcPXSrKFEPyb6fBbIQCBL3LWsqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
	b=GRaidsoEBDezpBslNimVyDJhru6D1T56+a0BB+IDy7ROSZYH3ds+gCiumu5eKe1VXt5x
	 2EcWGugsCPlzBZi8pdYxahE3r4OUlYBBjgQpnv/pIb372je+wUskt/N1ys1Wo9G8+zRHO
	 NBedKVpcjLmhg38rdYpSLllRIPxdNnp1EeHonImzXDusSGFOCaKpyNnTH3SCL3CW+p5HQ
	 UoApPAXxkyyvQbybRqsTz1dix0LadOsHehzOGaQJCkzKVxlZ/0zQLFcXTnGFa4V8hUic9
	 FtiJl1iwJsBLtFD662MuBY0hL0FCqEU+yixI+bWYqyUesuspmGw2DzaquV6/jwkZN0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=enXxQnZl;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95EF60A261F
	for <spacemit@lists.linux.dev>; Wed, 11 Nov 2026 04:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95EF60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=enXxQnZl
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so3312490eec.1
        for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 20:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371194; x=1794975994; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=enXxQnZle7j0Z7Z5svajTb3MN5Cu6uvhd+HoWg8e/5lg+4coKUy6wfx5q7CvUtxQIm
         E3uc5kEk5fNNJpHegPX12QX3sXdD+wVeaijwNFm5nFMHiD6fGqErVbkxIV8es9U9L6WR
         y6CzlV6LVPtbNw2uIZ0zxhwo8OotpMtVWqkjJlGIfCtx0zRXab611fpHva8BWiBtVH9r
         ALNkSzFtkjBnr2B1f2C0hkwm46lTkspKn2X+XTxu6caHzIoU0DC31ia7ojjDOkAMv3wD
         +Ft41bFha4SgKnWoF6SmH1Db/gW2nZlvFz7mL90dKKP4l/Vr1i5+b6KQNcxQ50gbAc3E
         tjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371194; x=1794975994;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=EAdDLnQMVAZ/pK/cIs2TxU3fTm0RrYWP8AUatEQLDwQpbfBvw2Yli5WDDCwuUKf7Tq
         Q94jwD9sPJagsTUYpyrFpM3TvtTasNKjRKwS2tVTb+yYKMDg066fV4QjoEwSGv/c8WEV
         vPB7vnloCFmrMGs476MY07uPNcMbqPOvFQb2r92yPb/yZgRRCPTljJ88GnX2yB9M+jMY
         iVppP4Jvdel5l3EXGTB4BY8nnKrC8rwdnkPZpSmBXq6M+KSWdx1JVn5BeC9KAfqEdAw8
         r9fpPgaK0sfEg8SwKHWaQOGKL33VUIHBetZ0lSokBbyCBbZFAF69M2BpdqzeyZhD95fc
         EuvQ==
X-Forwarded-Encrypted: i=1; AL+hErGqj7//h5m5UM4DSMWnRn84oDlbDBkOcJsALp6hFu6HodiV10ShbOq6I6Bq7d/5EZfE/s01Hdt4XA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/i/Al3LviOZp9GhPgvZLlYvHch7AFBCA1SUS7diO0HFmvFb44c
	/6GzHTFSdEJ+zSq5mFPX1rIYIGD+CqDP0KPXKPmnUqQIsNZDrSI5hvpL
X-Gm-Gg: AYBFou1VJ7pQfJRbNVKCfP0U/214vEZYyBKNwzlKX2T0cMvC7u2nll6dDGzyMlaa7QS
	hYjbz29kQPt+cKK/V6Dorrm/i76Yn/SrJTCL8YfS9zLM9u9p9nKR6laoEtBRY5cxnXwVEBtvkVd
	GbHswlq1fhBrZVwnqXUbOJfiuanTWX2Gtuz+s6WVT1/KiXLM/2HFu6Cjvr5wUjXakRcf6H6ni0a
	cmg0C7dmtZh4aMhRbFQAWoCCHF6B3NkE6LMbO1kT72To37cj/7q/Nam1scQWR3eWInWCvb9jZ2b
	y5+O+c9QyGMBzUetVeUHGeWki4VVvc/I1k8HMMe4EecqbBIfj1l6paO/8QDXV3GCmKMV2tNqLhd
	XQ/hnCAxum9u/78VmqM/wVnq7GI9VnP3Zhmv5qJzCLl9x4KIv7qnw2j9SfCUa9IsNz0vFVUvYaf
	cZgtXjzGIoU4sWoDRyrVbD4IVCefQuycv9yWe0IiEmcD05rwtBHpox4mVjR6rDx/BewKdEF3wu4
	a1D29LWdUCM6PA89qDLGUFmf2r1W97p245i8SIU1O1ss6KOdmEvabR/Yt4nLlFcqKnK67oYJv0r
	ifU=
X-Received: by 2002:a05:7300:c382:b0:376:bcc4:774b with SMTP id 5a478bee46e88-376bcc479abmr1028837eec.23.1794371193980;
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm13018714eec.17.2026.11.10.20.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Date: Wed, 11 Nov 2026 12:26:28 +0800
Message-ID: <0d340a99e07dfba7ea1fba6d9529a1a6.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/17] clk: spacemit: k3: parent eDP/DP pixel clock to
 the PHY PLL
In-Reply-To: <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
 <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
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

Hi Jerome,

On Fri, 25 Sep 2026 16:43:46 +0200, Jerome Brunet wrote:
> On dim. 09 août 2026 at 21:14, Cody Kang <codykang.hk@gmail.com> wrote:
[...]
> >  static const struct clk_parent_data edp0_pclk_parents[] = {
> >  	CCU_PARENT_HW(lcd_pxclk),
> > -	CCU_PARENT_NAME(external_clk),
> > +	CCU_PARENT_NAME(edp0_pll_pxclk),
>
> hidden behind this macro is a .fw_name. Basically these are your DT
> input names. You can't change them at will like that because your
> bindings are supposed to be stable.

Thanks for the review.

> You should not use placeholder name, ever. No need to make the
> name too specific either, from the beginning it should have been
> something like "pixel_pll" or whatever your doc refer it with.

Agreed. The new names follow the documentation: the K3 user manual
describes these two mux inputs as "pixclk from eDP0 PLL" and "pixclk
from eDP1 PLL" (PMU_LCD_EDP_CTRL, fields EDP0_PIXCLK_SEL and
EDP1_PIXCLK_SEL).

> "external_clk" is not declared in your bindings AFAICT, so at least it
> should be fine to remove it.

Right. It is in no binding and no device tree in the tree supplies it,
so nothing that follows the bindings changes.

> There need to be a dt-binding patch documenting the new name you need
> and then you can start using it in the driver.

Patch 04 of this series is that patch ("dt-bindings: soc: spacemit:
allow eDP/DP PHY PLL pixel clocks on K3 APMU"). It comes before this one.

I will change the commit message in v3 to better align with the logic you
described.

> In the future, please try to document all the inputs of your controller
> in the bindings. Even if you do not use them yet, they exist.

My read is that comment is more to the original commit where 'external_clk'
being commited, which is not from me. But yes, I agree with you.

Cody
