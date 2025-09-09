Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95433322524
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417472; cv=none; b=RYdoYIGzQHKXhvF83UK0xPlL+G2e3FSOs5EbC7CxEMgIToKMKwt11mOboKqTF+YmLIWSSDwhshWG1qqZURYHr9A2YucmLIIOypWgSO2lxYIQ4IVf0ByBa2hJKL0CLfB2vHAr6jbnlmtcaoaPUsziWm7MjlqNZ1ovIwIL4RqhmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417472; c=relaxed/simple;
	bh=rz+1WJdCMk4bw7MZU/uL3ew/4Ysn6aikcYLa1uqNyjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYFK1nYU0Li7GfCLlEjx0hU5QJI9IXmj9ko9SxwXJlNUTB0m/gY/GoIWkeTNu8UWHtXE84vpjvl2alAonXnVU3X2kyor7ga9FkqHX+a8i644HbpSE5CXZdVpbL6kS9e5oN3YIResP4xCcYx0P0z+SORZmP4BaoN5rPOPBUUbWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvjuuGGZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvjuuGGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757417471; x=1788953471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rz+1WJdCMk4bw7MZU/uL3ew/4Ysn6aikcYLa1uqNyjk=;
  b=XvjuuGGZkGYm6EixBvEm8S+Wb3V1yVlYVkLFn4a0l/K7tJIrB+1k1FSp
   JMzuj75I4L+gCBEr+4szR9CGi2c5AcYddpZYS0+E3TI7Br6t/DTjkjijw
   8xhNQ5E5vteitytEIT6+FpVvKZhr60HSwPq3qe6EjQ0bCtikO06Ic8DTu
   dDf6jqi/YZqa4dKT+Kp2aYKj2Sndb9gNBLfhvt9TDsP483qPzChzBuok9
   0L335KjAAtkdG1mFvGABtp+h0UJlu/n57EFlshL5KYS/S++5VcXHHqerZ
   l8qj3AE/+sbE+j/6+kghoU1vcx1sKeeFAUNTch9rWNpPhZzOO2Kia19Ck
   Q==;
X-CSE-ConnectionGUID: gzkDVo5dQZeQ1v8jyR/+Fw==
X-CSE-MsgGUID: Dkkvkr1USjSw2aV7A2oE9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59762843"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59762843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 04:31:11 -0700
X-CSE-ConnectionGUID: kETrlqaUS7SDcC66+bpzQA==
X-CSE-MsgGUID: d1Tczp/ZSi+Sia6+hUP0FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172980605"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 04:31:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvwYw-00000001QM0-1JWn;
	Tue, 09 Sep 2025 14:31:02 +0300
Date: Tue, 9 Sep 2025 14:31:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
Message-ID: <aMAP9hAWars0T83r@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.

...

> +	config = (typeof(config)){

This looks unusual. Why can't properly formed compound literal be used as in
many other places in the kernel?

> +		.dev = &pdev->dev,
> +		.sz = 4,
> +		.dat = sd->gpio_pub_base + GPINR,
> +		.set = sd->gpio_pub_base + GPOUTR,
> +		.dirout = sd->gpio_pub_base + GPOER,
> +	};

-- 
With Best Regards,
Andy Shevchenko


