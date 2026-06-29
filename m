Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765F32C08D0
	for <spacemit@lists.linux.dev>; Mon, 29 Jun 2026 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709121; cv=none; b=r1RxM6NZYyLx5c0XjofIrXEras8tJ9F8bin/pwnxaIOIRY2kWI6kBvu+HBk5yEiL3V+6sNvvx6Lvk1TpEr3Q7apEmO2nYsPH3SfZ3Gm069mTYJuKvPJVfdbUEAC7GO99r+MONBpYqioh+a6OkUCia/LfpH995zB0eZIa+fwWTZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709121; c=relaxed/simple;
	bh=CIWzjM+Jxse1BycqhtYy2huv0CauD709CmJ9y4Fmpl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/J0AJIrMAuatNQMSVOqB2BlU4b42qmP/K1CSl3Mu40zuE6P5rKxIQtGOY7HvOJibPjNwHndJfarawtPsG6zZIPKRDJZUB0Qg+al4vqBTOH/mPVquysTmdRu/xs9LOIH403c7FdaOTBM64KGsV24WPNwmxVUw/CG1O8POtW+HXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7sr0l6l; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7sr0l6l"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bf132969bso4139118eec.0
        for <spacemit@lists.linux.dev>; Sun, 28 Jun 2026 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782709120; x=1783313920; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QsB27okN3oIFcQCd02Iqvl+jQspzLnJ1Dz6viWpLCEI=;
        b=a7sr0l6lGWMYAf0/pspynH6ZgP28uGqwB89xt6q5n7izYcohQpoGxPOMMFMW/e531j
         tm4eF7Dv/eX9yCG4BZji5xns95I+IZ8Ze+Fy7Fbbwl9E3XWgX6y+jyVohZT4mIO3WvlV
         RC0vTYCmuhbdJB8zXAYm8Ny3NtbjoIRpTlbdfqz1nGG8Q2Z9vpEmpddSIHyzpHajGrph
         kkqpUBYckYH2SpfsbySnSdxOUDjZEb2Sz+qYLVuoqbX/myn9TU6lYYOrxlWNshrbL7RU
         JxiAMgglskf3gLHhfzFR3NaW2cRI6Tf4rcELdFqDqy+TEqa4tLYPz+URXNOeWJNcz3qm
         fgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709120; x=1783313920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsB27okN3oIFcQCd02Iqvl+jQspzLnJ1Dz6viWpLCEI=;
        b=KJGXmi9gPCzFoC9TpuiQo6WhOR1JF87fPt5Fx3pfPkXFt+AoRn9oZaM6Hpnq2df0AX
         9rTEsxSXxG0VDObGUicTJvefq732eJVGL2qRd8DPODSTsED28jpETi3iNzdU5eB0zCfA
         /oJLb5lLQaqsZNNHhRu/9UbhDzHiDOveIyP0zNfOdpZOjOu3RFN59p0D8SYscRcKQ0rP
         wzR95C5aheSRY0PlVMsxS2Xgg/i6Mp5xzoqcIJPEt6A1YRgzgWRYGwv0NJ5VaZNhJubY
         iJud3vJJvGyUGPLzhGK7YZogZ4XUnw+AhmeLoUXsIAKqegVkChnFeTIeXsLkKXKwpCd1
         0nKw==
X-Forwarded-Encrypted: i=1; AHgh+RoEmRiSSeV48CFILGi+iUXCx9EiQl83ummjDm4hXQl5622RrmYJOCGaHCzAHD4+aYi4gK8D1Zf1Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeYTXxntSfegDQkzASDQ9cpslb+x39nEQNqJ1iQGr8PPYqaTYn
	k6N3EzFVT5ifEYrwKV39IZGXH5i0p3HaJt8tGvCE6cIxRj67SSGD6QKO+CDlFSXIt8I=
X-Gm-Gg: AfdE7cmguRCHALX3eapwAss5Qjh0DGVlM6PcC2A+NTthpzYuwyBATwmG0EMFXeGhTF3
	i/GahKwR6RdA1lqLe+WozF6gjx2AMhePKxK1Ee7seky9eMHWwzESbVyq4L563foPy50gI5724u2
	dI+9Sin8xUxzWyrStsJpxwVOcjhcjsIfWO2N2YIEGl/Of4y+uU3SVzX2emjoForPpplVO2GDtdI
	BpoBiYyzyicZRD2bZnhoVSRWe54gpZ4j9xLUi+4Ew15d3RZglmf/qJKlKAp5JBm7GC/s9hIRqm0
	HvUVqlPSHSl2Yic3qCdRaq8eBnpkW57JuZmYShpMX1cKMlciB4QPve05Eof5ukZcy7KzLnz8QOz
	BbRTDvGqFU0fcbT7QOzfP05KuF9gEiiUGs1WPBpl6jKQn3R4NaOJLRgoaUgGNc6h5BfQJrlfM+e
	vec9GTchMfl9nL
X-Received: by 2002:a05:7301:2a08:b0:30c:ab4f:46a3 with SMTP id 5a478bee46e88-30cab4f48e1mr7122599eec.39.1782709119287;
        Sun, 28 Jun 2026 21:58:39 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f14f8asm27880242eec.6.2026.06.28.21.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:58:38 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:28:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: dt-platdev: Add SpacemiT K1 SoC to the
 allowlist
Message-ID: <7x5mgpk3z3aiebifhxto2v7m5yrikj52lwf5pzegzhk5aiehhj@jqm6opm6nrub>
References: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
 <20260626-shadow-deps-v4-1-bba9831f2f1d@mailbox.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-shadow-deps-v4-1-bba9831f2f1d@mailbox.org>

On 26-06-26, 16:10, Shuwei Wu wrote:
> Add the compatible string for supporting the generic
> cpufreq driver on the SpacemiT K1 SoC.
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
> Changes in v4:
> - Drop the K1-specific cpufreq driver and use cpufreq-dt again
> - Add spacemit,k1 back to the cpufreq-dt allowlist
> 
> Changes in v3:
> - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology
> - Add spacemit,k1 to the cpufreq-dt blocklist
> ---
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 25fd3b191b7e..e262394b56f9 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -81,6 +81,8 @@ static const struct of_device_id allowlist[] __initconst = {
>  		{ .have_governor_per_policy = true, },
>  	},
>  
> +	{ .compatible = "spacemit,k1", },
> +
>  	{ .compatible = "st-ericsson,u8500", },
>  	{ .compatible = "st-ericsson,u8540", },
>  	{ .compatible = "st-ericsson,u9500", },

Please take this via arch tree.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
