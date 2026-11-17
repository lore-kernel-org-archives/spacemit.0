Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913603;
	b=ADrqx+F3u/6Tb55KA0klMixhEobrIb0sWRE6tk8BGdcV8zFgUzJdLmt/HMmMt/F36AyC
	 UjoKPIhE4G8BRn16BfqkNWVWHTqbA9tuuaa03MkvD7jMPQi0tXhVL4CJczOBpw+cYZQLJ
	 Kd/5eAaojQ98DCAz+26KHFuceWUvZ7hcIrcGLhMQRNnMkLWl9hHNdhht7rhCUO4RMYjCe
	 vCL8iprH64o20AZ7AzHHeqiJ8caDrKCk4M7VbBZcznxWOnGPo9ZDYqVtDyfVUp15T9KSY
	 wb2FMkvptZXW7ZU42We/bKTBNzFgHKN5ORJg7t7DQBxPaHUnx9lP2d6kZ3gJGQT98wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n4s7yJbpQX8syBD03XjGhRC32jwUYZoWTRv+UwUgeKs=;
	b=WvXbwxy6TqyZcXnM6y7QPC3ZELaVuZAZpGpG/ddSDFxKbKvEPQrbOlnPKR4+i3t3i/5+
	 xdcvczv8x6c9h+SPgU+Dbup83h6GnNk6jjrdtAXEk4EM2VHaG9WRtq7KD6BRluBmEkOkD
	 raVn6wHy5BZ+SAFJvaItsFchngXGwyMGWF1b19sF7xfn/nTbbzyKRE0WjS+SouGsuvceP
	 7yIZz8HiCTwm2LUAfA/KeI5y2bXDswkhMRQuVgx4BgFINRcNUxb/cYjoc+9k/gZuV+ICj
	 +2TBXWJdcLx68qH3zKGdmqNaeKv2ttmkcS5ttpxxOfwkALtsSYosm4Eze4YpFYI6JHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GgtKX7jk;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70C606A329
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 11:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B70C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GgtKX7jk
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3655938c88.1
        for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 03:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794913602; x=1795518402; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4s7yJbpQX8syBD03XjGhRC32jwUYZoWTRv+UwUgeKs=;
        b=GgtKX7jkXEeGNTsdiF8O9HazFzj5ySXYVSIkqoHADYnUtyJfbTE0MwvapZa/B/ilhd
         qiONjET472x35ET/Lxddupu6eSdjqLKC+NbU6R/Mhr3urmbsrqOKF3owPeK2JFZKjK+o
         cV1VQ6eddV6dEXH5Z8WokwxYMZdBtGeV5tsc+9JWI3a6Vxu3nft8dBNluFoQmD0zUqmM
         gFUGAlR6H2w/Er/jxRS9iYz23sPaDqpvmFajBWUicsuMveeSNC/6lwgywaOr2dTYgjNk
         6LECrYbSCcOv85LriE8w64BDQHVN46luFtmscmqihfKI21RTVx6kVU6Whrdr5r4eIVyP
         zFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913602; x=1795518402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4s7yJbpQX8syBD03XjGhRC32jwUYZoWTRv+UwUgeKs=;
        b=uNcMdK/gsAMe8Yj4HWJXbyxinRCfevAG0G1hqD3HL20UgKtcN9Ce1jYjlY9wYxggad
         ZKzhhie4V49hTG8Ttx0LoIGJmdujE8SNM0kMDuQDu4gA+UofK00j1eRM9AC/RRLJkI+i
         SruoSVihvDXWIiqZpOPUtDFgEvJEfimufUzkpv+crBDP5GkQ88r8RrE4uG9OIeowRfgq
         MDM00gVPMoTenDPjvzq+e4ShLT8OBwov6raji1iiWxc1tKGUoeMN200JLzKonaugrlul
         Bf3vLYYJowROblsi/ZcHZDPpwn6E7XwxBbCp1KbTIVxhbHUyGYX6Ej5D07TN/iebL96z
         Ozrg==
X-Forwarded-Encrypted: i=1; AL+hErGHm6UATUnRhMrgRIyLF1piid+pRqSn2rkbYSrUpTiY/3mug6S8GycsBHnmhG6N+Rptcme+WmRc+Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8X2QUCUnOcuXpHsyckMRjsBYdq4ToamkdhjgQCiO+fHIPKnrFd
	A3JaBACyjseaYTv8SO1XvoTpf6WopfrUJA1+PbsBdsbGdYdTCVAk/gfCU2qeBDagcNo=
X-Gm-Gg: AYBFou1J11GV2yRnHhhFxM2QYQs9feFhMdvsizqz3kUKQyHUhvtSEXgxp2gVjmSRLXW
	lA/V40qBDd0tFe9pfGJuouG8r3Bb59dZo0U1+fWl3goriLwY2AKm09dkjkdWQytkqUEE/m0iHte
	bxRtdJoa6XQ5SOqtdUJTZV2THrUdE6lnSUPJENYo48FLuOnedYZ9FG1cYmTYmxmAy0gLhfl514u
	g49Cr32jfYyXLX0JB5ZCl1iPetNUWSCbvWomM1WjkoKlbNOBcKC70EGOZwfUAXqG1tOdLEy5AKf
	ka7OMyyHVIeNZGnOdLS4nyP0+F+JAkVGBBgtKdVq5dTYL3WQ82BJOSVw4WmiqGUT0vTE5vJKW4p
	sWiHpT4OPmEZE1Ja1/qfhsmzfoHWzJeFx0WSAVia87++eEjZg6bb+EIjFF1QzfSnQeKjp57L8Fz
	ufGaoj6efLp8+PWp1dXc7FOLjvMVeIzn0fz7e8QVMfU37gIN7rvx7ycYPS0+OARP63XXKWe8Ety
	QGPdgiihoOa27D+UaBdi9i0EDsI3sZVwW+husLZuLZPMR82L4CXBdw9n0T2Io0L64jJSutjuhZC
	SvJ/9Fw8K1mGRzt3ytAnOOcrCaBzdQ==
X-Received: by 2002:a05:701b:4188:10b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1b5030fb7f2mr12989338c88.37.1794913602124;
        Tue, 17 Nov 2026 03:06:42 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm39194951c88.2.2026.11.17.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:06:41 -0800 (PST)
Date: Tue, 17 Nov 2026 16:36:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Natanael Copa <ncopa@alpinelinux.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Milan P =?utf-8?B?LiBTdGFuacSH?= <mps@arvanta.net>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Shuwei Wu <shuwei.wu@mailbox.org>,
	Aurelien Jarno <aurelien@aurel32.net>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: dt: Set the initial OPP to apply its voltage
 constraints
Message-ID: <avw1Pos5Je8piwvU@vireshk-B250M-D3H>
References: <20261111130430.10359-1-ncopa@alpinelinux.org>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111130430.10359-1-ncopa@alpinelinux.org>

On 11-11-26, 14:04, Natanael Copa wrote:
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index eb15650f99bf..2646dda10aac 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -153,6 +153,30 @@ static struct cpufreq_driver dt_cpufreq_driver = {
>  	.suspend = cpufreq_generic_suspend,
>  };
>  
> +/*
> + * Set the OPP for the current clock rate, so that its voltage constraints
> + * apply before any policy can change frequency. Otherwise another policy
> + * sharing the supply could lower the voltage below what this one needs.
> + */

I think the problem is valid and must be solved somewhere.

> +static void dt_cpufreq_set_initial_opp(struct device *cpu_dev)
> +{
> +	struct clk *clk = clk_get(cpu_dev, NULL);
> +	unsigned long rate;
> +	int ret;
> +
> +	if (IS_ERR(clk))
> +		return;
> +
> +	rate = clk_get_rate(clk);
> +	clk_put(clk);
> +	if (!rate)
> +		return;
> +
> +	ret = dev_pm_opp_set_rate(cpu_dev, rate);

I think this works accidentally for now as OPP core could have
rejected a switch to the same OPP in this case too.

- We should add a new flag to `struct cpufreq_dt_platform_data` to run
  this code only for the affected platforms and not everyone.

- Perhaps we need a new OPP API, which configures the hardware,
  forcefully, to the current OPP.

-- 
viresh
