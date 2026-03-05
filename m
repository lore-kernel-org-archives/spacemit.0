Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0381A3A1A44
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715976; cv=none; b=TInEyMRBaf0ZL3j4og+94FO4zeUFpHdD6KF/mPChR+j9Fym5vH9JU+bdoWRWyKRk+5NJlVD+xn3I/FdZJ/hf9Dg/bucNIC2MZq6xhjBH7kQViSXubJFnqf+rPC2hm1g4POHq13T8/ZimXD+Dr6ifXqI5F7gymKlSFl7Try7vi+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715976; c=relaxed/simple;
	bh=An6z6pGF00+43VUaOecTwb49LKqdBH2wGqINr17mp5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyvwrTHj2NyMnhu4zelE5Rw3QrdKSo3D0KxHnbmwyyupEXRx9oagO2m4graLX1qV5jKRM1QnxMnOLnWCtrdKd4N5k3ZQP/eTZOtG4/O72UjR9K9urlgfHtnlNvEzw1Mv9i4S6o/5ldu/dfIKQWB+AGCY66VGlXBLUxtd3sCu4oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso2944263a12.1
        for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 05:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715972; x=1773320772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/3ao61LTSp6jCCF+e+2SF+gp23jwVu9a+x2K0Dcxpg=;
        b=WnEgx4JzmAFU3A0UVCOILiC+w+DfOm05P1alYhAU8HhHThxf2bqvyRriqwqfd0059Y
         E5lJDwRRhZBOcVYkrS+U+TnwL8aG0r0nDTjUnNUK8wnStaNUCtCIgjUVriWWWsPL22M0
         vQH/M5ZhNs+ElpOQ1Rs9zx6uwCOkgiVa4Mu5YadosddpZw8if1ZF8p+WALeOss8OZ7Ad
         mhQ73esAS92/YrnFr7bZmqYf9EawYedNRWHHty2LShW0Chj2VhfP0mnph4kkaQgkoloI
         q06DC0wsTs7fKYuX3p56hiRIzwo3YWIvlDjWUGiOCWqLN+XU1Q3XJ05rRaAm2IblQFqW
         6nSA==
X-Forwarded-Encrypted: i=1; AJvYcCU3Wx/gmDVSXtez5tBlywZTloa/dOB3rd6X5p8c2OVx5qF+50fQZ73YQN0wHCEqZM6J1dnJvMvd/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1/spX1DKPMopKoWH6xbJkLShuLbWb4etoxIPvZ5y2a3cUxEF8
	LeQ6jmVKSfOwPpINjlu7rgE1igTCanJjFNr6jjet2S3vmmWEqLmuSY8C
X-Gm-Gg: ATEYQzwG/senXia1dB9SPCIUiodWCI8rc8fWOAe/Fax7kX68f6WajSaEPE65+B1xTu8
	Tkcp7X8Z+BBS9u8u/uCpBoHVCmewRvm1jXeusA54JgCMfEY+oUQvf57G82PoLR+13r6wiCTx1vT
	yQjgHbSVtMKrEpUg0eo9zMpRs2ie+6UGR12YKXcgxJsmWgyYl4Xqtulma4+o5Bll98GnuTEjBsC
	H0UUTNVL9z1LE71/E2KrbZHPOH45Uqe/R6iL8hs8dzOFc82GCcGFm3Ah+gxCOqGipSxSzpxnYVI
	OrPRfHRySMAj0leOc8gxfcDWHMIjt4HWD0F1+iKvoGEXfpffnwEa4b5DTLZ9aOIKdSQ9TnA0byB
	m14fgWkMSGnIG2MzarwZ/jRdtS1VA8Zi3kh9GMUaPLdJEz2Zbuy5DhWWDhj6yZB2tSkRWoc+GmO
	DbdDyL5wxC8TqYXTBKi/KmQY8lu5znoHwi6amAWbjYQIuNNpqLWIXzwrog+9D5OWTsFxbwd1Mxe
	cbsw2why9UhzwzWyYMbnWt2K4LpIzO5JhHvcWMEK1hbNE5nEqM=
X-Received: by 2002:a17:902:f68a:b0:295:560a:e499 with SMTP id d9443c01a7336-2ae6a9cd41cmr53596975ad.5.1772715971749;
        Thu, 05 Mar 2026 05:06:11 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d19559csm154128355ad.5.2026.03.05.05.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:06:10 -0800 (PST)
Date: Thu, 5 Mar 2026 22:06:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130609.GB1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305123843.i47asdrjychwlgdt@skbuf>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305123843.i47asdrjychwlgdt@skbuf>

Hello,

> > > K:    \b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > > K:    \bphy_(?:create|remove)_lookup\b
> > > K:    \bphy_(?:get|set)?_drvdata\b
> > > K:    \b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > > K:    \bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > > K:    \bphy_(?:init|exit|power_(?:on|off))\b
> > > K:    \bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > > K:    \bphy_(?:reset|configure|validate|calibrate)\b
> > > K:    \bphy_notify_(?:connect|disconnect|state)\b
> > > K:    (?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > > K:    (?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> > 
> > What about
> > 
> >   F:    drivers/*/*phy*
> > 
> > or something along these lines.
> > 
> >         Krzysztof
> 
> I don't understand your suggestion. Is it meant as a replacement for the
> keyword regexes? Your file pattern matches on:

I was thinking more along the lines of using wildcards, the F: was just an
example.

[...]

> There are a lot of false positives, and a lot of false negatives.

Yeah, the "catch-all", for lack of better word, will not work here.

	Krzysztof
