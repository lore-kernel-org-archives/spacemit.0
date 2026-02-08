Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01AB29BDAB
	for <spacemit@lists.linux.dev>; Sun,  8 Feb 2026 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770562392; cv=none; b=YOAh2lpM3na8Y6hTlulYn+xQyl7C+N7uY/SjCHzUd56XZIfK7c+tqP1+afWFqMUwAX54AaGuIcn1vpnKPBh33Tae2Psr9amTJart90WIaJjMmau3B1F+8T6WIhSFrjgOb37wOB67o5v8QEqByzAJVikIWIXnte2STguVcvkQ0as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770562392; c=relaxed/simple;
	bh=6mVp2KrFl8YgrrhyTg79rNJi9T/xw6DGin2neGIdhE0=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=FoqU6FhHhc6brK4wqPI22GVSoCzcvelEFZ+P4rpbtf6Leo1rplg9ifaEdrYQ+gikRFrgUa2EpqqKI3O1TMmXAaxCkVUWKjf2DUUvHctQoaSZcqdeMNgBKHdr4OOfmwt/CV7Ng0yn4+MnyYUzOAnRCFr/evfKx2mf7pHkCh3b0S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgVCIPLl; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgVCIPLl"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-126ea4e9694so120692c88.1
        for <spacemit@lists.linux.dev>; Sun, 08 Feb 2026 06:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562391; x=1771167191; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8h+xkqNhYlCxgIu3rSmKZo7/K9DidHR1ZXFR3pIVmKY=;
        b=SgVCIPLlxbUfg/Ygq/euU1BJdz4uoteLfvx8ZpeiNoKLR04nMXGB03KcA76y7GpFU+
         RZ+hRLp9lYa03/5riibRJNmCqKT47Y3TpWtdWFrrhY1CTGGZxIhs2LljGusZXSjNWNVE
         Z25k1Hu3Ck8PoALfUVPTIFNMeu8xv23MSaXynHo76YpR2k3wEjU4/GDizI38ifmLd6mi
         a3rIRDsdVloh8KcP+EQV/fVnglSb+CZxADo4ndBpIFz8ddINpqDwXnik7izAOWPK+B2v
         PMpPBxNSCU4/6UGFR4r7CTvBI6g+fL9zw8XbrkVXPO/NeLRtBkVVctyaZtyclEuK+65O
         46yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562391; x=1771167191;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8h+xkqNhYlCxgIu3rSmKZo7/K9DidHR1ZXFR3pIVmKY=;
        b=tLBzjjJUKc0KtQXIxgNvOHBq1x37MNbs+CXrxBliKp7oGZuJtVAlXWLXU+BFWrdu45
         nZpzs40KDIyZWnOU81jtdC+AeYrHC4d6stMzd2ilHTqC3hm+bLvxNxE7yuVAP9CO9FHi
         BmwIpGKAfNFL+ZH+9aafbO8IrwnXO7BTJb7yxEmGI888xSjnxZ2WTjlApsDl8zZA7FQi
         E4pFkEa36VQIeTUcPHwE4h1kMEPU8CbYdlLhGMKkj33nFpvw3Ii/lTZd+jrMIk/PYQ0c
         2ADBFCa2YVbJdLdB2ZbdOJ9dAJIvqJ4E56/jHmZHkkoELRoA2xitVQXNLfuBBRSLTf2D
         b/qw==
X-Forwarded-Encrypted: i=1; AJvYcCX1aP2NcKQyX6MLtkDu4JGsfjOuZMvjScREKnXFpy9F9YGJioFj0et8wVA8WXoDmeUb62SygkvXKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YznICO24/GXLzMvGkrB7+Ylxn9ilwRC2ZYaB6VnHZpCAFH6Gcbh
	+lbIKMqJCzjxWaJlGZ2tA2ikjXUvCGqEedtUbOvHwXUHcyYBvmBLOBm1
X-Gm-Gg: AZuq6aKllfptIThNrWAi0GBQiC+BIguFj4qowZVd3AMJy3UU2xD7Y/pfvDquxjSXhdD
	Z4LlfXYNreitrXaHcCeW/YdAGcxbE2FYAZiagQA8DMgu6CJ/FP4BPlMOx/ULKZACwatJjEb9ASW
	FBx33q/kjQ+B3SYZBFNO+hkhBO+4GRT+TegzjzYiSAmLMR4pfViG8nm29YBSAttRu682vHVLV+w
	1BJ9GJyHvlsDSjEBRFgGK5DTDiW+4VjjYqsOKGB3AOAQdY7GOSM7MhH93KV4H79w2ZSgsFw4YIc
	Ea8rtF9CD83OTc6YSisdStU+FXYjSOJLKwjBTyqmlOKL+lOOeXlr5qqEuJHArOkQD400ZrmgEzo
	6X8slTkY9lM8Zu6iHVHcCbHS3baGXuA4YJtHpUt9UhTIZIcHhU7zWTNKL6IxoC6itcq3Z1sWs4H
	yOtQVfSo047MxMog==
X-Received: by 2002:a05:7022:ff43:b0:127:874:af0a with SMTP id a92af1059eb24-1270874af69mr3714033c88.5.1770562390862;
        Sun, 08 Feb 2026 06:53:10 -0800 (PST)
Received: from localhost ([72.11.140.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm8128977c88.8.2026.02.08.06.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:53:10 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Feb 2026 22:53:07 +0800
Message-Id: <DG9NZG0N2T3V.3DZ7YPCZAMD36@linux.spacemit.com>
Cc: "Andi Shyti" <andi.shyti@kernel.org>, "Yixun Lan" <dlan@gentoo.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Alex Elder"
 <elder@riscstar.com>
Subject: Re: [PATCH v7 0/2] i2c: spacemit: introduce pio for k1
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
 <aYiR0VQXvBJDSQPh@aurel32.net>
In-Reply-To: <aYiR0VQXvBJDSQPh@aurel32.net>

On Sun Feb 8, 2026 at 9:38 PM CST, Aurelien Jarno wrote:
> Hi Troy,
>
> On 2026-02-07 23:08, Troy Mitchell wrote:
>> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
>> enabling the use of I2C in atomic context.
>>=20
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Troy Mitchell (2):
>>       i2c: spacemit: move i2c_xfer_msg()
>>       i2c: spacemit: introduce pio for k1
>>=20
>>  drivers/i2c/busses/i2c-k1.c | 316 +++++++++++++++++++++++++++++++++----=
-------
>>  1 file changed, 236 insertions(+), 80 deletions(-)
>> ---
>> base-commit: 2fe0719258a48c204270366ef574066122e81924
>> change-id: 20260207-b4-k3-i2c-pio-318088c1b3b7
>>=20
>
> Thanks for this new version. This is:
>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks for your tag. I have collected all of your tags in this version.
Apologies for the delay in sending this version.
I hope it hasn't held up your patch queue (p1-reboot)

                                  - Troy
>
> Regards
> Aurelien

