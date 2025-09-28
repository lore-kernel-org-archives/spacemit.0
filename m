Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BC54A01
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 02:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759025541; cv=none; b=MFMhOJc1Q4z6qqlSSdL0OpK8KM4huyaPC71FgWJ8n8JCPkCfcQguSd5Sy6fRZgrnF2wKARTWP1eFWJ4w+aZgT6PnSJ7/mPXQnpNiOd37a/leKzEfdzd5QBAQJjwEhuv6rG7H3mQP8d5p1ep8hzGqcxcF4mdzYrpYQ6SKa2N96ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759025541; c=relaxed/simple;
	bh=bXbecS0IyDLvfvVFyAQIfZWm7g6T5lIqeGstL+ERs8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3xvLN1wBLa24lnB2qJg8QpHptiFzdTd8y2SKpsuAo9fWXb1bnyhRWMb48QE5So/Dy87CA0Tm4+mDFssiI7sCHCUPEbpe7EFqnQVzK9UMMt+wl4F45FhxSUX1b6eDYS5upxBy8a92Dnkzj9VGnFmFZYshBGTyY0Pc9/6/YDMoek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=WqBsKfKl; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="WqBsKfKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759025455;
	bh=eY0bpTnzgWUlPNePnN5gj3Yr6PlpWRkAzkaXahzV1o8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=WqBsKfKloEWSMEIV6IqJ0Lcslxjz4POAEHPuUoXJMH4lAvbG+6hqCsBKi1QotAege
	 AcpLWicvYd9ZXO/79fkAGWofk+ci3vyyTmSt1+PPVZZndQdtWpL8RgVCmaakGMa4Df
	 ut6Yn8k2guEEWfIyPy6VWKjV0QL3LrtmYj8zWpyE=
X-QQ-mid: zesmtpgz9t1759025446tf4c98f6b
X-QQ-Originating-IP: RtsBnZ4ihVU9CHOc9np/4YECKvEAil73OOUAMK5O8B8=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 10:10:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11079297919091120086
EX-QQ-RecipientCnt: 13
Date: Sun, 28 Sep 2025 10:10:45 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <97073301A892F7D5+aNiZJbY2_WqSZR76@kernel.org>
References: <20250927220824.1267318-1-aurelien@aurel32.net>
 <20250927220824.1267318-2-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927220824.1267318-2-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MRw/zKT/0BpPfcSMtKC3fChJ++zZnxyqvO/A8aqARujyNIIEqVNlosPT
	RPm00bV6Ul5C9qVFu/mQW31wF1IJwPZcvKZU0GbPqg1YFwatDNw2gsQ1P2h6VNfV4uoios9
	tsiZzMGVQokvN2ExrY+0ibVMUEWeoBDOMl2xyK5i+lYUyNCBr+D6k9PuA3O2wDglLNEgoBr
	Uk3ejpn8cJNYwOQM5ZJ6rZiOuzY1E0FN6bKbj9HSu32KWQUXlTpKI/8KrOAN3E9hJLxxrlZ
	UmZ0T2lCZGpYa0i58E3wb+4lcjg0n/yP3NribUYtuBuX4e6E6/zcnVipH2EUaGy1fTCqicj
	brd7FCsD9vXjQ7Qear0rjMAxB8pqfU73SFdIvAtVzebeEGfFP718Eg6BaQb/Zi6aCuP5/lA
	Wfl75FMognxwIvxWanktT4GP6Bvx6P9uPnx63bLyKr/n55zmFCQ9jbupRy/1xDdLQ3ITpYq
	bWhQAcP6UGEbwznBN6CvWH6kB5wjEBqxDrlyqI0Ulik8GFj+e+Weejd0Sizy5kXpt/dCuzO
	9cU+mRKYZMNXCgmbYhPYWEoIs3JYVr8sgdihZbM3K9ZapzqB+GmlRjuE3rtb2iU913YsgwT
	Fq9klMoZuTT67RQHgUlWfw/eMopXwIWb9ZcalxDraOKdV+0S63OP5BqGPietBPBOcm00yTP
	kaG5des2/JMvFwoPqObziKxncSIn0flA9U+OkaxpPUbAncSH4Neps0c0tT6i5wJsdw61RIv
	rd+1r9guJtP/Njn3bzctzbU/aqZUVVTHj5OtueG7EyVZgsEo96KO3qbQFItE+ctfzpep4OD
	cDXESCDnjkVeUu6LSI8IFB+u911xqHBrUWwAlu/dy0xTyIzBAz00jtSSvrDgMqD3S0TdQW5
	s7pP4OhgGqMKZ6Dtzb+XwwdeLFn7VZDBDKRM1GLHH6laG5X7JdNLBVigR/kdIuHaASc3K3i
	gk5nRK/RRttAz5pCPSthIdbnpPknWVXezKD2LCBvYoB6PqskJ7pXrd3k+4lQYCEhFVwzHme
	TYOt24Xnyo7uS/RmksxH/AdvjiFMaVP07Y5Nf5DPSX33R53yEBbGsT+3K0eo6uA1um0QhTI
	ApNc9dY9fAZcD7PczMluZMO1pXgNkAkaboYb4Ixz95E
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

On Sun, Sep 28, 2025 at 12:07:40AM +0200, Aurelien Jarno wrote:
> This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> chip, which is commonly paired with the SpacemiT K1 SoC.
> 
> The SpacemiT P1 support is implemented as a MFD driver, so the access is
> done directly through the regmap interface. Reboot or poweroff is
> triggered by setting a specific bit in a control register, which is
> automatically cleared by the hardware afterwards.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  drivers/power/reset/Kconfig              |  9 +++
>  drivers/power/reset/Makefile             |  1 +
>  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> 
[...]
> +static int spacemit_p1_reboot_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler, regmap);
> +	if (ret) {
> +		dev_err(dev, "Failed to register power off handler: %d\n", ret);
> +		return ret;
> +	}
With fixing what Yixun said, LGTM.

Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> +
> +	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler, regmap);
> +	if (ret) {
> +		dev_err(dev, "Failed to register restart handler: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id spacemit_p1_reboot_id_table[] = {
> +	{ "spacemit-p1-reboot", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(platform, spacemit_p1_reboot_id_table);
> +
> +static struct platform_driver spacemit_p1_reboot_driver = {
> +	.driver = {
> +		.name = "spacemit-p1-reboot",
> +	},
> +	.probe = spacemit_p1_reboot_probe,
> +	.id_table = spacemit_p1_reboot_id_table,
> +};
> +module_platform_driver(spacemit_p1_reboot_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT P1 reboot/poweroff driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
