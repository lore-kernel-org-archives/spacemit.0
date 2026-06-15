Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017BD2DC798
	for <spacemit@lists.linux.dev>; Mon, 15 Jun 2026 05:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781500043; cv=none; b=L5lDPYA8XIx/p3cHbh4CmQCMC6fgzsLyDEBgfxFLOHzogz0SmoAH6YNyeqy1s1CnoSGe96x3PMBPdu/6GFlmCm0N9xvhIm0GVqO2d1F096E8s/tkywx0nums560Du9USKkkmcm3pVa4MSBQBuPojbNlp5rw3fm48fZwdcLAQieM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781500043; c=relaxed/simple;
	bh=iNVf5YMgw7v/1a27+G4oX6+gXGKseRTy3IsG+KE4wnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5bCW/J6FaIsXphe3Xi9Xsq/N8i6PC+/LnB2Zq4Jd8SJVg0Ql7f5XckgCXI/QMOfirwE1aYSVUG+d2Vf3q2hUC3VQdgSe8xLI6Gy8/hmjJUsqLExQ2dYFmmBVU4h88CKHC2r6D4DfyCoFxHJNM/S/pbCFQ9BpT3LvfOw3K1goJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXuQATFy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXuQATFy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c379e8ffso18355375ad.3
        for <spacemit@lists.linux.dev>; Sun, 14 Jun 2026 22:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781500041; x=1782104841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/Oj6obfAcAELe8NNKZFmVNeON2ZbUEPKWSKWZaFYsM=;
        b=BXuQATFy2SjHWllNMatU0MXdzBcsBEZ5mAOFy0lffKaleE4Zzl/BhvlohlGOiT4l2e
         K22RgPOFgVdL/Qdi3Byxwl9hIEZ8BHVVZfwd28R+JFtX+LpK0Qh1urc62TX4QjtkUOfc
         YVoluotNJ+TcD3gzTNA5T2Z/2snNUBcmRipznCmX/xp0L4DzBJP8igiapEvll9tiECky
         y7T+6bzj2byrFo5C5s//B0TBm39zJ0WY7EiwvmcQp6dDSOhHWlFyiCcekGqCIgtwfjwN
         R26DvTpfxQRiyuBcs8wEQjv1tNZo0CZWH8wsfEpTEeDbFr9kqQxgvuhF1+RSOxtBOQbv
         7P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781500041; x=1782104841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/Oj6obfAcAELe8NNKZFmVNeON2ZbUEPKWSKWZaFYsM=;
        b=DA0wFaMG0FIt8dypOFRGu/n1aMGGBFfLTY/2/+HXDrPW+FLjRVNrW8gC2HkahKg4j8
         up7RyXYxfxVJ8w76nI6Z0YRq2E03XvFHB8NE7ZDn5BF5YBq+fc5cmi20tx02lMaUgZ5J
         PuyXIdhpOL8hCu2fYQC2R8TqTLIlPJAWTz61DmUzxcTteEFrCLE00hrUuZDuPDoCrqh9
         G0df1Mx3UKrmuYCCruhwbBBnzl8A01lF23hHsqCJtKAj3JL9Hb++jLdUXf78gTeTuRoi
         mZrJcalUdrTawsI4VViJJDm/Vh0MF7Rg1TK6qtmn6c3JfBowDecKQ3OWPK7ukbJlmJbE
         Z0hg==
X-Forwarded-Encrypted: i=1; AFNElJ8imgXaHuxNFa7RZtQSKJhPRrD7Y29bYESQpPKRN6zcTdqlkym6IMJHJ0p1E7cRnV83eaFk+dmNSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDuYdTAUuX9yYy9c5H7uEp+O0D6eLB2QhqCaaJagT7a8MUWaBT
	9MMN/1n5L0mzCsWBmLKebR5VoHtbqAF4hOwW68EUw6L0tvnX7fomptDO1oiyGlh/igU=
X-Gm-Gg: Acq92OFaWvisDZ+mGLLCgplTS/yKyRcLS0n4F5gfeLhx9+zOEcUieXRvG5tcAnkHBkd
	mqK6DE4uXLDDofFHC7ez67j4i1GYGEb6GMUJ06975nOp/ZrgXqi0jj1wOKPPPIzQnXPGEs6KfBj
	rrKkliO1IFumgSrcriM1V3KotdjX+6o01M2ADGa0Eb9O7ZI2dglEyBGhPPY5GNbKXWAvUmdeIlF
	SmTyPNZOCItLWMCo3YepPjGHKEPLVHuJR4+Ne0QpDttlTMmDtdU5+D9Vmmso5gzaRl5qrJq7c/E
	McDHuGUPsUK6FUznuEhuQTpMXtObxjhb4EeVE0+O8Iu+bVjuK0ldilIh+qBnIkipE/imp3N8rkr
	0nfJjto3mgA7rQvaby0re3XWkO4XVTMw8pEVXXVqF0e42Z3LaZ1Dif6dsYTtkFP3YPJIu118mR/
	9DPDImf/J/tYaCkq6iXtsrUCE=
X-Received: by 2002:a17:903:2c0c:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2c66417d194mr100735495ad.16.1781500041150;
        Sun, 14 Jun 2026 22:07:21 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433558449sm89984355ad.78.2026.06.14.22.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:07:19 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:37:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Message-ID: <lt7l6hvia6hahvizr6qwirgnhzjqdfn4edzt7fakqxbhkcmaxr@x6d5h4i55edw>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>

On 12-06-26, 17:51, Shuwei Wu wrote:
> Changes in v3:
> - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology

Why ?

> - Use one shared CPU OPP table and one cpufreq policy for all CPUs
> - Link to v2: https://lore.kernel.org/r/20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org

-- 
viresh
