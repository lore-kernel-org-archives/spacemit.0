Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F63B47DD
	for <spacemit@lists.linux.dev>; Tue, 16 Jun 2026 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781597952; cv=none; b=WRPXBSex7rI4Hq8+5gRItQApNrmM3gVLdFXkMEP6LaZOEMl3MRj5AUF9ZF7rZ3UNSm0MUTylMjuXhrSp2q6Yzsj0glgR15Tbobthn2mamDSXwA7yXcRceihXcSZi49+pbP0NJ0RxXsKAv6qJn0aiu8p5eBD+oBa8FTvUh5QEa9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781597952; c=relaxed/simple;
	bh=xYc99uvXLsYWScO0EmNoWIRKvKiJpOTShn+ZEKrkN1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwXhdlKPCCuMNZgnykXdOmSW92qB/45HWNZn7HatDhR2yDY+ioRFR7KgzcneO7VkUwHK2aq5GTUkP05DYVM65wMTrA/lk3rt0TuaXy2CgCrUIUp/54o1PxKG+qwxxjDYcnhIJ+153/D8KuhdGtFzcILGjVfDXbuLdCC3YPmhsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQA8LYhT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQA8LYhT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c27fc587ebso16686655ad.0
        for <spacemit@lists.linux.dev>; Tue, 16 Jun 2026 01:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781597951; x=1782202751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PhNt6MHC4AegleV/WbvHUk1ZYZMA3NIq1ay5U/dxpKQ=;
        b=DQA8LYhTedR9E+SCEqvpubrhylfhmu0pS/Jh9pZTxLHt6841Dcn7jpLLKZXCqpVjuy
         fUKNfe3b64wHrreEOqbXluG4fXGASHMUEsE/eyrmfWixoOlKVoEvHP1opMRKNDs4b73A
         uJCV3YH6IWjs7VPdPRbQmWrzzDb2pVoeFD4KMWrBec2gjYwJiLnPnFv2LxSDsjtO1DBs
         mpo3Ld8FTUw8fNgUa7oZyoEKLOtbksRzwg/V5hjOsZ8jf/ak0dFEL5jO7dwRX1D6dHVj
         ifAacVv82G9QjQXq6/htm6SvdCQf4qu4aVLyLgBwIXXBuoX8ChxhzPTo7XgV2fZ94gL4
         q+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597951; x=1782202751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhNt6MHC4AegleV/WbvHUk1ZYZMA3NIq1ay5U/dxpKQ=;
        b=noFKnlhoKziCZBeKN55ZPktJV8TYrVId10g/d7/V2U21J3ufQTmCj5SaWTsKorTlUB
         i3h7XjRBP9OIzGCGPzy814pk2fkCKmGKYvUfVeGBxKvYBpI0A7q3WpoBlJd83RruG7/+
         vG/YDH/eShYb9vbzfktL+7e4Yvzybt0cW7A2oHkbUy56cYelVzFNhpIRFeN13VCrgmAB
         +EVsA57NgghdnIFICJ59dW8kVGsgYG0e4MxgoLYg3y5Acl5O5s+qyH2/QMBlbOVhSo+9
         +hUI5tm96ES2ikBJJeOWLuE2lq9nNEx8XwxAR445dgnUDM1MjTx3HmqlotSKziPyjvwd
         Z5MQ==
X-Forwarded-Encrypted: i=1; AFNElJ85KCB6YkVIQwdMopOzz62N0NfhfHsCvMyGlV+octMbBVo5gNJ4eEdtsnbEQiIRPbiAkh85ci0doQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrU9pnuWM1fl4KpXHSHfnUmC6JZt6AJehGT8UqS347QDhbrzrT
	wAh/gvndJSJq2I7jFZRpXTcq0fbseu6FI8QSsBziLmC/gwK4+oa8PKz6M2sWmxlt+Ic=
X-Gm-Gg: Acq92OGQgeVZXxQyDf4a92NhKFHS3sl6S5d6l7aV+U/ifombCm1gxQ71+3l/cc8uRwz
	45948GJHE+skDAa/tm0rLTZsfqz7UiEVvg6VVSBE20oZaljGTOZLgtMMO9kMAU/HhhloGDZisde
	MYIFtGiOXnsq0cZlSk226vWEQgM4w8ux9mq/pTRKrWvQ4iP+tzuUbR9cOD4UjOCYw2Vg9B5ayoA
	NKVbGqMXq7ziyey/Ga1AJVXYpEm0EWN5ZAxMTSQXpi4qFL66KTCBw06dbEhm8L1CMmZg5ZchW2M
	qcqVWQX6TdHAxsZBWx/Ej300HUsGO/E4ZM4Bt17XYF7yBZrOrwUt0PGosdnCw/wtu/EWPwMdCQk
	+HIvv2bAFYgc8I25MGCpyFyofGVtu2hqfWSyjiuyF7xXegoBGnpYDlAFXQqw5oFnHbMRJ+tzn0d
	bgPVaEOHz0LbFQ/JoEDYZAMxU=
X-Received: by 2002:a17:903:3890:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c69a1965ddmr27832715ad.25.1781597950906;
        Tue, 16 Jun 2026 01:19:10 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac631sm124267105ad.44.2026.06.16.01.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 01:19:10 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:49:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
Message-ID: <nffvtnb765pa72xcfhmxe3wepxpld3e6265s7imvldbwounkzk@jmrrhtrwau34>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
 <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
 <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>
 <wjwkykv555gkeqxabsqcdfn4lomcopawsv7bgm4bydc5likhjs@p3ca3p7wbri5>
 <DJ9M2IDYE6XZ.20RN5AFBYNB9Y@mailbox.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ9M2IDYE6XZ.20RN5AFBYNB9Y@mailbox.org>

On 15-06-26, 20:11, Shuwei Wu wrote:
> With two cpufreq-dt policies (one per cluster) and these ranges, neither cluster
> blocks the other. Tested on BPI-F3 and OrangePi Rv2 boards, works as expected.
> 
> Does this look good to you, or would you prefer a different approach?

Looks correct.

-- 
viresh
