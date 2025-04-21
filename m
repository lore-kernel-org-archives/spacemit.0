Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49DB1EDA11
	for <spacemit@lists.linux.dev>; Mon, 21 Apr 2025 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262686; cv=none; b=ZgRzJGQgoVvRb5/xgt+OgqNVgwmtFcwo6yGl093Tlmb+qeKp/URCfVrovfnU82JCST0Ec4rWyxv//uFVq1ukRirjWMd76qvmsBuhfKLVqh+C2aEDUVoHnkJDZADzoazeDSQmHSC9RadaU2+BVlacHrocAMSc4HiF5epP+CLTgHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262686; c=relaxed/simple;
	bh=5AIG1sMY/MlIZGAcS5S5t2hhJlsih5VEaj99xoBne6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRT1PCwQQK4938v1QQwDKTn51WwadZw7UVwtrI94aYW1NwFKQsElgg2ryal8MjWOIEz4ClniZ/NfjvmNspvFnwgWcvKPv7NpPs484YgKnQFA16oLQMCLXfj2WXYWNJEPlU6F5sgc9xtTO3FY0/DY+t/V5LdwcPtCjT4kmENLnGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Lsqhuv6m; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Lsqhuv6m"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476a1acf61eso42618601cf.1
        for <spacemit@lists.linux.dev>; Mon, 21 Apr 2025 12:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745262680; x=1745867480; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gI2L4uhiI02NJe/WReim9SGsmkpDN8uWBBFo4WhEb3I=;
        b=Lsqhuv6mJf8zKT778R9BeO5omb/49YU3HD0fZwjoEP6ZL8AzuIBmOjVVTe+OjGoqm+
         vxJdWm6RKJ4JsU4d2JyNE+pyF5Zamw22AlRWnJqWMj+yLkBT7ZTnNqcntLMBkZVfKvTU
         8eUQRi/bDFrQsg4UdbYJQS9TP3cM1Ply4xb7kS/N7V100PFhUAFEVDCaMA6u++s6Y2L/
         rz/RgEXi+BH+ccKMf9CFvWfjeZGlNsbkRqo5Ygdmy/EEk7m//GPtiYIyPULfClQtDPRL
         5O0PvKBFmZcqcQBivXqfwHEEpc5ui5F4b7HEAeaHww0+M09vjjD8Er3UGCQib9HD1kwD
         HZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745262680; x=1745867480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gI2L4uhiI02NJe/WReim9SGsmkpDN8uWBBFo4WhEb3I=;
        b=v1o/sTxsMsY2pvmCsjdBMCkfLEe9AUdPbVWi05aib0pMyOTWf92MGW9fsTmalUdowC
         GGUR+ajZH4sTZi3eXUYlLtTHG04PrYd2RGuBqsJuNE7IdehvPLQ/xUdhp7WPZjhuLkMS
         QxQs3pTFz+sm530UzOZNKM4JD8A+naYPGK4hDO3ilONuhKOCaXvt5Ftm1FNPjClb/n1y
         rW7ss1vvq5AStROWn1RaDjX+5ZySYmYWSdSX8WLaqWWUDdrLA1RwmaulpXGfCbAZ2aII
         A75I6eFrVOBpOR/NzHD6t5zXawRKBUIJrDgbF7VEoPy8aT4OEn1Sq9E3xmVcOzGrwhQA
         e3ug==
X-Forwarded-Encrypted: i=1; AJvYcCXZBNSQVgNEMwYV5YsiccL0wF0vIYT78Gwe45Duib5hRf5bfK2P4A48oEuu1MTiENo0YGqCa/68GQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCq4feTm0TzTq9Oq7DluNZwTnOEQuLrROnsW9gE+PCZ8H+ygJo
	zBEbJ7l7r4UiSkcpHfmxfIbH56vzXWVixK9RHgxv3pruwTCzENlSdk/k/PpkIqk=
X-Gm-Gg: ASbGncvYzjev8ErRLA9t3K0XAslEGRWrXOjz7gneEq/WIYWKk+63qoChOsQGeHYonEJ
	ksgOmbDBKvrI+VH5I4pkVD3BVSjGQu1CeQ4nqBPuWMg2MRufX5LC4SUGMeHlJdOawWlhave6kJM
	1Bhv6Zu75wQuqIEqsmrFCbUZZSOaSpC6HNKB/b5hTwMm8Ta/lmOFOTT5B7buVqBSr6CWsc5/GvM
	KXW3sv2fYquF9ISTjJ4z0IkIOUUp0w0VTt+tNLb4ZAoF1evuDZZWl5E4hJc1r+V0Bmb0t/O0dHb
	zzckdsTmveXNzBaAAyXuBlSF/C0fOXNMT8JxUyL0z3yFthrTb/f7R3Juw/J+ZJg2Da6E+RhPUph
	7a+62
X-Google-Smtp-Source: AGHT+IHP/Ty/ZP20dA5qBvEvFjaNUxmyfhkG77rGIDC4dMEZdaAtit8jzrqmhWV8xbqy0JUyq8twcQ==
X-Received: by 2002:ac8:5e4f:0:b0:474:db2f:bd32 with SMTP id d75a77b69052e-47aec4b971emr238825011cf.38.1745262679762;
        Mon, 21 Apr 2025 12:11:19 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c188a8sm45206481cf.8.2025.04.21.12.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 12:11:19 -0700 (PDT)
Message-ID: <29954f84-75b9-436f-8e36-f52bf26a905f@riscstar.com>
Date: Mon, 21 Apr 2025 14:11:18 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: spacemit: add clock support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
 <20250416-02-k1-pinctrl-clk-v2-2-2b5fcbd4183c@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-2-2b5fcbd4183c@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 7:15 PM, Yixun Lan wrote:
> For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
> the driver instead of relying on bootloader or default hardware
> settings to enable it.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

It might be nice at some point to set the clock rates
to whatever is preferred.  But this looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
>   drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 67e867b04a02ea1887d93aedfdea5bda037f88b1..9996b1c4a07e72f2a3832b759feddcd4e07f2159 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -2,6 +2,7 @@
>   /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
>   
>   #include <linux/bits.h>
> +#include <linux/clk.h>
>   #include <linux/cleanup.h>
>   #include <linux/io.h>
>   #include <linux/of.h>
> @@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct spacemit_pinctrl *pctrl;
> +	struct clk *func_clk, *bus_clk;
>   	const struct spacemit_pinctrl_data *pctrl_data;
>   	int ret;
>   
> @@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>   	if (IS_ERR(pctrl->regs))
>   		return PTR_ERR(pctrl->regs);
>   
> +	func_clk = devm_clk_get_enabled(dev, "func");
> +	if (IS_ERR(func_clk))
> +		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> +
> +	bus_clk = devm_clk_get_enabled(dev, "bus");
> +	if (IS_ERR(bus_clk))
> +		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
> +
>   	pctrl->pdesc.name = dev_name(dev);
>   	pctrl->pdesc.pins = pctrl_data->pins;
>   	pctrl->pdesc.npins = pctrl_data->npins;
> 

