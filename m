Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E1C1547C9
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306228; cv=none; b=QwqRKRIYMXEVRHuqOmf5KPTS1ccwvSW9tQopcl1ygv5Uqo/IJ92yvjUSDBI4t9ESxdAjGzrMd75TNYR75MYLMK1CieXQqPgBXmrjze6mdbLGXZvJ+NlkNTD5mkMBFcXQjF+r2SX79kRruMBUTOsiqZVb3eIff3k3WwSOdt+3cq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306228; c=relaxed/simple;
	bh=PxqA8fGkhLyWpvdGiiXd1sJ1JUPWNYJtdS3Gl6lhaNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBgzkGcJEtBlGOHCcR/1QOVt1W2BPYeOOVUe3ZLQLs3bc8MpPWvGR2cGoP0mJNzeaieJrYpKTct6P/BMGq4UVjSVQa+zS+LVE3WcqzrgRSVwPZaABEJ6KKipTl2LDq3IJrnZ/6iPVoKgeRiSy84TCWrGQeSkeOkc8T02/RXv5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UEjCEfjX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UEjCEfjX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso15165335e9.0
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 04:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761306225; x=1761911025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5qxkD57psZ9p1LY+6HM7xc7ogBuTrsa0anMGrCbLRs=;
        b=UEjCEfjXz6FJwrJsBK79XVGxnrvTLr0kOCaShVc2hZl0n1kHEaBJHqcMx+1SlAKm+d
         oVGwOI9jKFYMXW5KzlgQ/obS7LDfkmqMbSfVjYgJYVJPWftqI93EVrJ1GbaY6xNhFSc0
         E5I8U5aK2cMvLoHwi3orZs2pvyicBfF/etJ/gxvzbkUtHxV7RDWAFk/llfLWqrAnbTgz
         SM57u5kWXFjfndkmKi+YMt5Z/Rv0Hu5XlApn+79mBd5mmVIP+rSjdF3CbiV6lXceHvEX
         EOpYyTm436tPHFNDBWULzoJEIzZXLVNiJGAlNDinklHLFYOeXBMVaGsyQ+vYXR5P6j3+
         FVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761306225; x=1761911025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5qxkD57psZ9p1LY+6HM7xc7ogBuTrsa0anMGrCbLRs=;
        b=H5oad+BLgTjCHv5tQiIQcWgYoI/vQ5KGIYGvR77nynMFY/NS0VWlRE4qXbUIUolUje
         Phm2eO9D/mfnAaoxt6QCtVhppORN9s11y7rM+18HtVBQP9QAbXdhEp6+tuO/5uDj0VHb
         N/0WM99gShxNihY6l/IX7Sbbexq6D8kOscJwrl+3PC/y+zOurHSLtdBUdcOA6bDhdHt2
         V6PfixUahVgOfbfY/Zdx1LgtlQNCaMpiMLaxIEX5H16JXHXqCNSfbMBaWz4IILzS56eJ
         bGFrEmhnNv/bng6AQCNUhm7xFZBKUr2h6jvmHM8e4UuL1z+qHutk4jUCodeyF6QEMV8U
         EsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnC69jnV43oetrf31JO1olQtVa25l7bQsd+BAFYLTYphWsjvVUK3nXJ+HdOCb0q1ZKsZWToe7WUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv1ldEnOhTWierg3nbxhNbBo2yrStLwK5NOjM+ioGoTKP9eISb
	RdizuiwyO5Xj9ChYTGgBL4J9zoc1Qo1dvE1OZ1NouZLscY0Lr6IDCYUnK2AXKi2c6/s=
X-Gm-Gg: ASbGncsfPQkTaJSJWPrB71bAC6wHPOodJnEddqGtEwLhusJzYmi1FPh/cfsJRXag2LQ
	kAsWLoBcijz8z0SiZG6VUtdQwde9F58UBODFvepWvia7rgLnpleLEnlyAUgA7LR3zrjuRwTn71t
	tKk0qCNnrW2nr6dth0obaTsQ1x4XbjfgFjlug62auQrFJ22MkziShjjgmehU+Y9+Xa42Bbl6uyh
	5ia0RI9THeXoVCPlQFVCPw9alH0UhAQMDOrO7dX43TnQPNAe3bD8JjA32zmUvVpO0btQMHBxFck
	M0gboudnTF1RfkEbhVnXY5H3z+oWiCWK4Ya5gS3PICw68ikUrVb06rqzGQxvOUJz0WY2QZMwYkR
	XemQWgwoYtT2viEsyX0+BoU/XgK0sXC6ZXNIcF2IQxUYEXCaUpoppxVDnlKmthh28U9gh74YeWJ
	tyw5JcVg==
X-Google-Smtp-Source: AGHT+IEFZqjbBQ3BoVlU2o/IDQHLthWzfbI/IS0tbpMXmAbbZABjCZQYFwtUHO9XWsJ78BnMwpcv4A==
X-Received: by 2002:a05:600c:b8d:b0:471:115e:624b with SMTP id 5b1f17b1804b1-475d2e95f39mr16080735e9.17.1761306225250;
        Fri, 24 Oct 2025 04:43:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475caf152absm104269795e9.9.2025.10.24.04.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:43:44 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:43:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [bug report] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <aPtmbe9uoHIPfZz7@stanley.mountain>
References: <aPtiNCZ_KBezL2Dr@stanley.mountain>
 <E26A36F90026E89B+aPtkgbhoPoTzVnRN@troy-wujie14pro-arch>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E26A36F90026E89B+aPtkgbhoPoTzVnRN@troy-wujie14pro-arch>

On Fri, Oct 24, 2025 at 07:37:51PM +0800, Troy Mitchell wrote:
> On Fri, Oct 24, 2025 at 02:25:40PM +0300, Dan Carpenter wrote:
> >     424         i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> >     425         if (IS_ERR(i2s->reset))
> >     426                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->reset),
> >     427                                      "failed to get reset control");
> >     428 
> >     429         dev_set_drvdata(i2s->dev, i2s);
> >     430 
> >     431         spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
> >                                            ^^^^
> > dai is not initialized on failure.  Generally in the kernel we always
> > check for allocation failures.  Even when they can't happen in real life.
> > I was hoping they were going to make a rule that allocations under 4k
> > wouldn't have to be checked but it hasn't happened yet.
> Should I send a fix patch now, or should I wait for the maintainer to
> revert it first, and then fix this error and send?
> 
> Thanks for your report!
> 

You should send a follow on patch which just fixes the one issue.  If the
maintainer wants to squash them together that's very easy to do in git.

regards,
dan carpenter

