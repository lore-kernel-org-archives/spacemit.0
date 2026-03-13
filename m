Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFB531E83C
	for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400881; cv=pass; b=Cc6cS0415msrHv4gktM51ruCxv9M38cnHaVzikuv/tnM0zXWap4Vzt+ar2lZiI1zj+Xm6R98YCnZpHe90BYttBsmjwq9KFWBDV9f1J0m5ZNBOm8hMTIlqqogt3lDFE532y4YXkbjE2/Jx8WXDcZbiIEUZLOyyIc/BGfYenLed+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400881; c=relaxed/simple;
	bh=7fVc/jZfynFeoSYgaf7HxtjcfzW1V4HoQrTDitcvLZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nu5Ubt44ROlsYXrkK9iEgw7LVVnI+R6s8RODLX0PZbeiNLpaAvCI6yaFICyUbnCWjiViIr++UEs1LuCo9NXAcc30Eo6h9m0XoXoJiiXlIUrJtShMPSYSp1fqjHzGMWBgUxUx2ckOLEjoQGjtt+NLvyplIHaizwTIg4LVvk7mNAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bY5/fpBH; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bY5/fpBH"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-509006c070eso18068131cf.0
        for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 04:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773400879; cv=none;
        d=google.com; s=arc-20240605;
        b=BFIuowV8oQVN53xUMOljnXqmc/4LYtr3ev7Tkj7YjzEov7UAA7+CWVoNN6UWIy7B+X
         lTQ+y7dir4yzM7lvU5bicZj5jhmKBqg4uQp49rjXtgN/kDpK0yZ6GQOScd50jtJUdeOw
         sZIaaYNeYwrBNup2sN9Liux8Yg1TnhzWMukDvS+XH1OpQ2bEfGlmHsbvznRvcwkBOIr6
         uIcZJUwhvP4wYbKtoPVjFaajTLBOMaRBRS0yyB1olSzKUh5yco/bFnst0H35pTZiCmea
         eUDpao6fcSWckzv4VjzjAArr7qOpVlaOKtiJN0/L6Qf6jSdcGZTVH34uQNhCsNRKZ9r4
         wCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7fVc/jZfynFeoSYgaf7HxtjcfzW1V4HoQrTDitcvLZw=;
        fh=FK/SHkey6qI+2eGaDUbZbcc0dSt2/+ZNrdZ/9CBaJaU=;
        b=TWFTi2wbCpBoxblLIXwNVxo7sA691gJhHPBde7ru/jlPgvK6DcAyzacfVuJDC018pW
         9CfavAWnnLSVnFNBcWcx6U41/b41f63JXnvxRJR77jqfaU1OMYpj4gT6QIL0d6Pf8Y1T
         2HsDyn2PVd6DaM5220J4MEyjHYX07BjCe6Hr/iZvk9F/Io4rNlC9OPtlxqWHi0pPwYUZ
         P/0p85xwF8VxVulG0UOmqSAo9sKigIz8lifE9ujGdminUO36GwRKtvTsM7DZnaBhjNfR
         92SCpb0lptETt2SOkpQ5vpwp1VGr6h7ajg6Hzb9jsVFN+yPPYchocei66iajcObkCJrO
         qGpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773400879; x=1774005679; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7fVc/jZfynFeoSYgaf7HxtjcfzW1V4HoQrTDitcvLZw=;
        b=bY5/fpBHmJHgwowHAHDM6ewm3sd8bK/gr7mjZV6tsgsdJPV0fjrPTgmOtIpAG9n916
         XpcXfzDbiTwipYhe5S5bDhtJRRsBs3AJ5qPyyrAzR/lhJv9s43wuITcERBfDRVSGfwMW
         ju6mW2i4zFNd+BQcBs+4AoHa47Xjd4q9QwBKR5cx9s02GwERXlDJKnEdu5QQUI+9hVoz
         2xRnUiqtAsF08dOLrUxLhDnhyompPnU0mfmExV7HJjSxiaHRx/YeJ4mb3NPJMTLrGdOG
         VmHpI31329ffNPzEu4/ccpbMBTTCFOCDNsDjOIQ7oUz6NrEaewSVUVqdGbwbxRyQdOPO
         1Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773400879; x=1774005679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fVc/jZfynFeoSYgaf7HxtjcfzW1V4HoQrTDitcvLZw=;
        b=lrglLx+z5Mb0Rl1h8WY8GbZGZSy7TdYTSvFwyY96YIGlR+gk5pUuFyIqdkRQLZY7dw
         wft0IpZkYcYbhBxyt4HKoSDcLZZxvN5ceFz4H911x5yDspoUUFNKabxBmBWHTR5Y4vDr
         XKA2G6f3l42Db1SUGXEhaBTBcK3gBasdKASNSErz7R22cakFq7gl0fkHFeV9x1B3v3GY
         KwsQ31KWYRUYfV7hyKDkYDkdk3C61rwrdzxrMaDLIuOKnTCPloFicziWrY41KFJ8H6me
         BqwsRXJhNM/6wF+ZqnIZpimDmldXSfda0+LDVBN+fG98Wty3JJaQsxOvHVlFuO+VkMWh
         LyoA==
X-Forwarded-Encrypted: i=1; AJvYcCUSBIxpg7MAypue8LPl6eQlYP44gTM5ewi5m7yOTWBsl34T2zskIT+j0hST9UwwNoneVJsfMCt+Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1/q+B2lSqv4Kg8fkf3gWdfeU34x/JZTlhoNhS9JIP+0+56Q35
	n1u6SwTGDBDwvc97/gDnGu8dBy8jQQjIIm8YzwJy79ibBME5BTJV7HmfGMD0/odWVW507SwBDJG
	FSBxpEppp4tjEwovX4ezMKTnIMoxx9p8=
X-Gm-Gg: ATEYQzw4Xr3jNgye/YRiq1Al7GV2oEK2fN6ZxfnEbX3WencVokHzjZZMADcTZQNTPMg
	asD5fIAHoMhQo51zM8dvY0fU+Ov7StC7Fq4DnHy3CY6/PBy0nO6E7tQK2mLl0I/OUFtj7LetRlm
	m91yHdmhETJ+KHcsHxwMvZkfwBtJpBSp5gxZntD1BMANgjqM3tjJidKegqHLzJtF2YtH1dYUA9B
	UVVm6UvVvI/j/37nRFLYGpRIHkXGO79APIOjBwEuMUxyOVdXd/aesBaHeUdM9NkRYLLkTQgQvdz
	xX99jA==
X-Received: by 2002:ac8:5946:0:b0:509:2222:4202 with SMTP id
 d75a77b69052e-50957e65448mr38456401cf.71.1773400879027; Fri, 13 Mar 2026
 04:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com> <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 13 Mar 2026 16:50:59 +0530
X-Gm-Features: AaiRm51wBTKcyCiwjUblmLGy3GXdm8W7RXj8vtcE2IrwfuzlmNKUiXiuwUzU7RE
Message-ID: <CANAwSgTkyyPYExj8fwhtG1mEmKkKWqQf3ZwaJrsvj90sMf1kJQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Iker,

On Mon, 9 Mar 2026 at 17:11, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
>
> Add complete SD card controller support with UHS high-speed modes.
>
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
>
> This enables full SD card functionality including high-speed UHS modes
> for improved performance.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>

Can you add the same node for k1-bananapi-f3.dts in the next version?

Thanks
-Anand
