Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016DA4B1491
	for <spacemit@lists.linux.dev>; Fri, 25 Sep 2026 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347438; cv=none; b=QEK7XsS6W1LiVgLj3Y/Qlr29ubs82kgk3WbX3ZjDBsjazpPaMPGc+9XivLGIn/L0jehJzEtuDu9aHVGr7xnfwwYxoJ5VMmox1zNbJ3r3lQWiTZJfiudjjoq00SYCuSBui3I5Q1i1WSW+cqfetuT5ihEMnrBCC8Gzsg/FRzCbltE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347438; c=relaxed/simple;
	bh=s2tP4LuXG6DitbJlb4NU+9ieo9q10zgjsECRa7Nn+zo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IBDKJEkf7pWEzxaQJ/8KjtnXt5fT943tVRYIcgKPF/BJTJ4M20MkAhOg1SW0UdXvKeoHSatGHIKGhUqapsDO11RU/MCS/d76NAvyr6mVMGr08JubOebofJDQd+uUrueyUgeMNFlitCWxxOLm8j8wiVpz2djfKzJAlJUx5JMSOEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NbANSO73; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NbANSO73"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so5027555e9.3
        for <spacemit@lists.linux.dev>; Fri, 25 Sep 2026 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790347430; x=1790952230; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DtEfZGf6pOZoZKp7BZybV8NV7US5hG1rb4KkghHs3uw=;
        b=NbANSO73jfQj1MURwWdi+IhjPfkgZNAgkAyyRRIRMvjMjKBogWuj0ttOJoTMSFbpne
         dwzsd/b6bcvnyui3KsUwnlktjZFzK9rOOc0GPyWl/Z7w/7dijNIllnB9dl/DMmvdITwL
         sLl07Hx00AxmpXX4pJsdMRgCJ4esXbuUzuREX+NFwFbyHefJ7YZjIP1UIFfmd2KT1kFa
         f5/x7tNTlwzsKQdZe4iIQcdaen5pHfiI9H5GRLKjr6PIMdRtwGVSL5ZCEFQDt3cRaxHa
         hjU2TNjEVHMBnAkhOMWNQQVuQx+6kTPM5EZo1L8gOaCFiLlQ8PDcdpt9P4NnNCpjow3B
         W0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790347430; x=1790952230;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DtEfZGf6pOZoZKp7BZybV8NV7US5hG1rb4KkghHs3uw=;
        b=CHurDaJ00Or4AhhU8+aeOVS/lF5ZKIa7ZV70mtRMtcJzs3Rv8mX1WU52yUtk0qUM7C
         QXlZcceP1c92EZ5M+BF5fjsnGo69YW+fS0Yb9nRTh3hZgQz7f6JEIlPZBQaHTsGJQQVr
         R89C9IkbqAb7Tvt13wa8+0LMGbok2jgo+F5SgJx5vkW75Q0tQIwHzDUYJzO6lGWYu6OQ
         Cx+Oj9lyGAHQ/2Vm4uMyY7iSH0wFaOYJ6mCjR8cWqvpHvPDbB6TBT1QgV3fE64T+3ddA
         aJt7eGw0+3FpBfLhvHcCO+QAFb6a9vkcz0VZDx2/4T3HGcMGdumijLpVaGWUIlsIADsb
         /07w==
X-Forwarded-Encrypted: i=1; AKwUvBy3jlyCGTH8+ry1ihM0K12mUHjxvxVFXKb4kT+Ycumivik7jiIv2D2EiOZyRETpvXj15oEzCXp+zA==@lists.linux.dev
X-Gm-Message-State: AFuF++kwL9Uj3SBwjHm518eHlYn0vFTvFML5tdxSI06amye10z+nqX68
	Io+EaniGu4YIm93+/PNhhVMob0d2MUrYYQdbEcLYzKR3pDdXicDzSOdEKz1nqSbEB3g=
X-Gm-Gg: AYBFou0vj3cQPBPV8myKf2YmbVpRlU1yQUjA96/Hg89Ql6ZPPzll7Q8EdfI0G7N5/oJ
	A4kw0y2Cc4DWuSOxBNJveG7Gab5CXf4QRr72kilI7JSy3PkBhTTOQpfsVuQHwLEd2R/s2FvyWrt
	6CI92MMNfFuTORcifdgG01rFbWRUTFkGZrOLtykfqavcTcvS2jiOEG6+uKONA31p8Ts/nLI1CTn
	vhICQwezALWOVwOeSRYzNs+rUNumeXeL8kBLEmXTSnMbfQ56gODb2I9b57TyPf0Rjve9WT198W+
	4bXD4IbiGH1dyLvkvR+ZCj3qIEhDY6zEYzRGIbxRWHS5Eeb0POEL3RfLMtM0gC7UBXjTkvKt5pl
	chMIbG97RxQ3UgAlF+cSuL21deq4GQIVM0+gCY5LbtIx1aCp0lYlMXBK3AjRF4bDs5TX46bC54R
	6RaUtJoV1aBcF/8IfAs72g0MWyn0+L8Ev3ZJ8deMWftkbV3fS9m63z2FtTWROYoa7DVXHwYiRxB
	t7VlnW0ft394/BrGg==
X-Received: by 2002:a05:600c:c8f:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49fe66bdf3bmr105928135e9.3.1790347430286;
        Fri, 25 Sep 2026 07:43:50 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35607bsm7104435f8f.16.2026.09.25.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:43:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Cody Kang <codykang.hk@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu
 <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Guodong Xu <docular.xu@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
Subject: Re: [PATCH v2 06/17] clk: spacemit: k3: parent eDP/DP pixel clock
 to the PHY PLL
In-Reply-To: <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
Date: Fri, 25 Sep 2026 16:43:46 +0200
Message-ID: <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 09 ao=C3=BBt 2026 at 21:14, Cody Kang <codykang.hk@gmail.com> wrote:

> The APMU eDP/DP pixel-clock muxes were parented to a placeholder, because
> their real parents (the DP PHY PLLs) did not exist as clocks yet. They do
> now, so point each mux at its PLL and let the pixel clock reach the
> controller through the clock framework.
>
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
>
> ---
> v2:
> - no change
> ---
>  drivers/clk/spacemit/ccu-k3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
> index cb0c4277f72a8..afbbbd797826d 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -937,13 +937,13 @@ CCU_MUX_DIV_GATE_FC_DEFINE(ufs_aclk, ufs_aclk_paren=
ts, APMU_UFS_CLK_RES_CTRL, 5,
>=20=20
>  static const struct clk_parent_data edp0_pclk_parents[] =3D {
>  	CCU_PARENT_HW(lcd_pxclk),
> -	CCU_PARENT_NAME(external_clk),
> +	CCU_PARENT_NAME(edp0_pll_pxclk),

hidden behind this macro is a .fw_name. Basically these are your DT
input names. You can't change them at will like that because your
bindings are supposed to be stable.

You should not use placeholder name, ever. No need to make the
name too specific either, from the beginning it should have been
something like "pixel_pll" or whatever your doc refer it with.

"external_clk" is not declared in your bindings AFAICT, so at least it
should be fine to remove it.

There need to be a dt-binding patch documenting the new name you need
and then you can start using it in the driver.

In the future, please try to document all the inputs of your controller
in the bindings. Even if you do not use them yet, they exist.

>  };
>  CCU_MUX_GATE_DEFINE(edp0_pxclk, edp0_pclk_parents, APMU_LCD_EDP_CTRL, 2,=
 1, BIT(1), 0);
>=20=20
>  static const struct clk_parent_data edp1_pclk_parents[] =3D {
>  	CCU_PARENT_HW(dsi4ln2_lcd_pxclk),
> -	CCU_PARENT_NAME(external_clk),
> +	CCU_PARENT_NAME(edp1_pll_pxclk),
>  };
>  CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18=
, 1, BIT(17), 0);
>=20=20
>
> --=20
> 2.43.0
>

--=20
Jerome
