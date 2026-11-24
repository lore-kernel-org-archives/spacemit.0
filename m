Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795494049;
	b=aH1juwC4sZLXkghj/RSMHRKMQib5MAEdSP/SQUV+75C1zQjU1Bof3NurXjJ7/+X0QM3+
	 yT1HYKSg2/THAE73GjIxLXh4Q/BUw6Az8+MFvr/qJlymnKK78Ks6qILh2Zy+3n36UDflc
	 PCwxRK69LKdrpH0OGKO6rP6rxB6U+SkxXrz3+Tho+RiSmN8HqGyxolKzC7XJlCYTmwJ1o
	 6+DdBnlj0jmgQl6bQ+wGYNM97fiRj2Dbi3PMzsqV9Sz224EFvrtiAXa5fUt7yoGTuh9Cy
	 46lknrNit7rCpkYAlEHw5L/J1k+qWPZB7eaoD/xYGhbGRZ1apW/uA0tGIBcMc8c8p/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
	b=m1EEWfKFLh9TMDluaaseZuSC1QGMigq/HvaEAtrcriRBUBFUq161WLr7euVmqWJzPXDN
	 AUrnEs2icpcYrWWmizFGFi2HhlDTT7vvdKkPg5kkjG+gAwCT7/fBgjXnJguvwA8uecZrF
	 qdWsBGgCJN7sYija0fPUOFeNAkmAq2WP8D6dBVSL3OSKXSs02ID7XyOobJdVMSFY4CoRW
	 Qxdoabetuq0Fr7T2uxl9tS8DsaRY3MPLAY4dEtLr6I4hO4J3xnoCN89TqpxxWOF4sDPhQ
	 nFALdpKpCYQ0TWmbz0aFWzoEFEoick0lC1tkgu0fDDOk7AjPk2QolDb3p1bjEDmaveQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efI9QTDS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43677606A326
	for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 04:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43677606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efI9QTDS
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so4577459a12.1
        for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 20:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795494047; cv=none;
        d=google.com; s=arc-20260327;
        b=e/xGQe6qXB8zL2fFJblcypM3xFha99XSlCFzN3YE+QYIKlfx8GgNlYuuhcGbNEe0XM
         ylM19pcV3kHY1ggxbvkJQhnI80rINNxbZr5G9/Hw6yRwoaUlD9Jakuk5lPDWT0YuoSrX
         vnb6UwsWbXWS/Xe8BmQ+VdOH04392fldZG6LcJk7n0TE+r6ESLMAi76AuKjGRndSLiNx
         Fnhe64PrQ7h4J5QukvCrjj3cH/9tOpcErn4cFksV8Y/ZhjWZM/CddrEBK3QzfGms74Ls
         7lr15hgAWd6E2NzxyIUF5Zqhmr5K4eFZR87Zmoy2NVTGPeJQ9UH6IFp6Cbjxw0xAXz9z
         dHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
        fh=FFlXUucz65ENVMv4u6GflsMfwHpsKAqSlUEfQPn9BLg=;
        b=XHxO4FeA775RrFT2kFMAikxCGHO/zIgZHouvxShqBMrrj9mgG7ihF1qo5T5wiXy008
         Nx5YNI9vi0Jle8MNcRAVfP8lMNxsODiVTFnE0WDALnlyHs0kN2Xk1+BU5yx8QYKayfP7
         Qzzr0zgtrx7CgtjudoC5gISHUcPfpUG09nHRevKKgEo9XJ8/Ic2SGMFEnb1rwJjCJ6Ll
         ka8fuMwiAiUIoKIkKGDY/LjLruYn1lGZj2xmB8qCsPjQGWOukGgURv7k1ROI24A72Z3H
         HyHnFqpoM1vsUQRxj10VI/hhPZB6lKymfYZJ6yF4RJU9BfoMnKAYTIWbx0rpaI34mf0C
         szCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795494047; x=1796098847; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
        b=efI9QTDSBxrJQhjValG8kCnHwoVwR/czSy6HwxU5vt/4ElH9XDtg1CzsI8bNaO+TD2
         wctpwFWOOOeBuXJXBdEucg3VOh9Tf5cFZ6JdLVE6mo1gM/fcMhJqVwWDVSLXkCn/KUAB
         4k+9s7K0CAOpym++n2YhPVj4OGsik2tToz1DRhw9183W3TiOub9e9etiRcHUE6emlu3h
         p/Hqep29lARz1ngX3IZt1ylYu0MG57bSdK/XC9r8DCDHCXxgZYBwYqBAVhgTAyfIItgh
         xBFb5dWJdSm8EnJ9XalJii4LA89qPKBORN0cTH7U9mTACALYOu6OY2f7nhNYkfcVsyXS
         Izbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795494047; x=1796098847;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
        b=rfXOjl38cHTuHZiW9HGiyVA+rUNug2Uh/esIS8ZyN2eHoQ4bxBp+QE1uZ02NJkCf9V
         CF2pfSwh0ikLUoAakXCrsgtjG3N1vSaxq6q2QZ3OrpWMgOH7GVhO0QhbuenkPwPdrLyq
         Cq4NvbGO9+YT4m2IdkhvPJc2z/T5PJrRDmWnmbzSeiSmZjIV5qXXNHJw5zvBlbFwcFyj
         pEincfNu2h6XzUoTq9GxQL+QGSnoCkiwiImiqHvo17b0eky9fa7jQadx8V8I2yiGsCWd
         yy557cLpKPIStznvTXhgyHYwNxTj92vx8CqIO0Ity4X6Wx4LqJZsrlF1LN/1USCM1kBU
         4KMg==
X-Forwarded-Encrypted: i=1; AL+hErGV/U53QVh4Aj3VNBR3wCxGNAz7jDD2jfh/9p6HHyFXXtXKJi61YPMia0j01gXmlYtxXS2M9GLzKg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/PNENgrkdtN0Ki+G7A+A6D9vosbrzDqQYKOiG6AC4t4yYJp5q9
	nLJbuDcw1NF8BY5yfVASqrJ11sF9Z4A6Xg6527B8tSi5ml9hAk9dh3XAzFQ5gS++HdjUl28fWiS
	3FdRt46JcLO15ZsO6LwEhLcoKZNLmFXg=
X-Gm-Gg: AZFdTZfQe/YemqLr83RluQBayTzjLykoL5cgH0e9Bo2n2nzslcsF5nf4atB+USikOYA
	19+WMaxZCzoN2O378FfASXyAt6a/kc67WiqMxkYygVoSFPia4eQIseN9NqfjPwQnX1pFsk+/RFa
	4+An0L8ZJFdxbppGZWzdaW4aJVP91h0v17Q2dvKIFC1mPmLZE8+DbeKBLHtcJGWgmo2xNDqyi4j
	BBLV5BsNmmiAol+bDS8DKDFESttg/pHXMQI595fJnejqz+7SNhNFTi/8nc7rW/nuSaYP6ecJwTq
	D9UKh7UcelNVR7sePaXhXufsBHa8foBPrZxrlby29kYt4yep6N530THUnwaRqce+J+gubTQ6N6E
	YS8vgJmVyqrbaQl9nGbIYw3Yp6Exa6luWKck=
X-Received: by 2002:a05:6402:234a:b0:6ba:7762:3dc6 with SMTP id
 4fb4d7f45d1cf-6ba7762424cmr5526320a12.31.1795494047241; Mon, 23 Nov 2026
 20:20:47 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118104935.1716-1-linux.amoon@gmail.com> <20261118104935.1716-3-linux.amoon@gmail.com>
 <awS84s2FVdzy3j4Y@aurel32.net>
In-Reply-To: <awS84s2FVdzy3j4Y@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 24 Nov 2026 09:50:34 +0530
X-Gm-Features: Aa3M54o2V3tALqDtTk5FmFGSg-XejOz73sQbTVaEuMBBmEBfiB2hu2jposXV5Ww
Message-ID: <CANAwSgQXRojN2x4NypLajJ8tUf2cyNfdfFLnaOFPd1hXuOMkJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] power: reset: Remove SpacemiT P1 reboot driver
To: Anand Moon <linux.amoon@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Aurelien,

Thanks for your review comments.

On Tue, 24 Nov 2026 at 03:53, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Anand,
>
> On 2026-11-18 16:19, Anand Moon wrote:
> > The SpacemiT P1 reboot driver uses I2C-backed regmap operations to
> > request system shutdown and restart through the PMIC.
> >
> > The system-off handlers run in atomic context, where regmap operations
> > may sleep. This can trigger invalid wait context and
> > scheduling-while-atomic warnings during shutdown or restart.
> >
> > On SpacemiT K1 platforms, system poweroff and restart are handled by
> > OpenSBI through the SBI System Reset (SRST) extension. The Linux PMIC
> > reboot driver duplicates this firmware functionality and is no longer
> > needed.
> >
> > Remove the driver along with its Kconfig and Makefile entries.
> > The P1 MFD driver and its other functionality remain unaffected.
> >
> > Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > New patch
> > ---
> >  drivers/power/reset/Kconfig              |  9 ---
> >  drivers/power/reset/Makefile             |  1 -
> >  drivers/power/reset/spacemit-p1-reboot.c | 87 ------------------------
> >  3 files changed, 97 deletions(-)
> >  delete mode 100644 drivers/power/reset/spacemit-p1-reboot.c
>
> The patch is correct, but you might also want to remove the
> spacemit-p1-reboot entry from drivers/mfd/simple-mfd-i2c.c.
>
> Anyway, while I support removing this driver on the long term, it might
> be a bit early to remove it. Indeed, while the driver is available in
> OpenSBI 1.9, using this version requires either patch the vendor U-Boot
> or using the upstream U-Boot which still has some limitations (thanks
> for your efforts improving it).
>
> At the end with your patch 2, keeping this driver a bit longer doesn't
> hurt, as it is only used as a fallback if the SBI SRST extension is not
> available.
>
Ok I have no issue keeping this as a fallback driver.
> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand
