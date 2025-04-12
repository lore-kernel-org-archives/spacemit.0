Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5611E480
	for <spacemit@lists.linux.dev>; Sat, 12 Apr 2025 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744461934; cv=none; b=d6aIor/IT53OeTJCe5/Mg7vnEwq9Qb2augMyDtgN1F/jy8EP7VLNFvtM5xb3be4/D/S3AHy/vhOynp60xvAF1AGuOt/iWBegM22PdYtgcFUJYI4hFKlXKKGA33yk2lUsr7qxtgT8xDwwp8kKORAzB1kbM3kw9G7+/nHAqu9kgVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744461934; c=relaxed/simple;
	bh=BlqjmiCO5gHfE6pk+/2AbOLM/Pn18+xedndRW8/FHps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbo5pzNCsk5Y1l+1FaeEipceb1Wrh6uGZ/WVjSwz/+OFYAkoY47aeHYDMB9UwhpAZMF/6UKfdc+mfEqpV20Y3oiNYUR0nbPu6CJAC1bih8Xb7P619jVCna/wNlcENKZd6reqqv4n77JfykwPmAPNOtmtNQZdBIPwf8K0fTxJNd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMyf6jJL; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMyf6jJL"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acae7e7587dso70576366b.2
        for <spacemit@lists.linux.dev>; Sat, 12 Apr 2025 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744461931; x=1745066731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CSIu8JpD+88b1gGZOa4ZQUcLcr8nrVGNpfocXHyTMo=;
        b=OMyf6jJLQuacceHC3vZeDt9FT7M0B1XFiNJATTiqXG4uwjot67K7SVbTqb750kkdje
         7hx/49+Cpw+VgI6rLOoyxRu4VkYP0VOr8cBE1AHRKvAxsyc+KlfBlMVrDaBDQZ1iseRs
         DpNtT/SCSD6RwD9XkDQXhcilygMuIpoTw2qge9FyW4vGnYzhJlOExWBOVItD6k9Y3Kz6
         VjsrY+BA8IB+yjfeUE+q7CdKGeQDEyDjOKIpXJkJOYDbtBq/GrqJk1L4MOMs9DmRqUOa
         WLJXz0gPzv7bAg9ipQvNOAr8MydKjt/9Ftyd1t8c26/EVpl/WcJwAZylWgPWjIBAkqjP
         7E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744461931; x=1745066731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CSIu8JpD+88b1gGZOa4ZQUcLcr8nrVGNpfocXHyTMo=;
        b=RU5/EBMgpueuhzWKzfMs1iI8Q7X1XWqXO/inxc2LtGIfXIH3KI0Y9tSf+KD7hsmfSO
         tUest/OUrJTw9Ae/6vIsYnQJCfWGCOFSZly3tU+wrCGDYyBUbeFTdEE/vp22+6vLCmNJ
         9TdINDpybfwse7HHRfuMNQRLuWQzCHKDB6dxP5Bw+rhiVmW1yGeqWlWYEmSuwInPMe/Z
         1sgGa+/4+dBmFssKKQ2T3cmFDGPRFnLXILrJTpCLmQt8nzdorQ8hVKGChX+BeYfn8P/j
         Ljw5UMzVjjAPBLo20l8DFY3DHP//nc026KiOHOl1o2gR/O6o46oWbv674I8uEdda63Xl
         poEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ81e/zDVzhUF12IeLlS0Bj4FIV1tiCbv+89MMBKgZHvYOc2uT4smC3CnUu01FnIkf4L9jnqBr9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJL+3mIub/4wohpv71esvqEoBBP8ItbzpD/tCXK05MJwRbJm2K
	8TrmnGjArdaGeXC5ShLE1qfQyMt1E41/tFhPvm2ssilxrbYH42tLKZEzxOqHI1TqUQDZ7WtA9Pk
	PvmUVh7pBE6g+2Mh6SsHAhbu3KhI=
X-Gm-Gg: ASbGnctQwTzQVisj5SN41mvjkhTouQmYEZFqOR+m/GOkIhKMdVeF4PknNxi85NPBI4o
	2PNgwfN//KyN5cXiyuYWle/KFYZKsT6U9E3ZzKak/gkDdFJqtgZeRbH2I11i/9eVMISuXczLEiY
	gzXKvu7uYOPZUvEOtBkRZf2Q==
X-Google-Smtp-Source: AGHT+IGfC+z/RHEDg/9TFMKy1xjqNYqDOuAW2IXR4RFyolm1ffVLC2JPi9pavWhIuEFFaxynDwZ5//r4gGu6ZPYkfY0=
X-Received: by 2002:a17:906:6cb:b0:aca:d861:877b with SMTP id
 a640c23a62f3a-acad8618795mr365643966b.49.1744461930521; Sat, 12 Apr 2025
 05:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250411203828.1491595-1-elder@riscstar.com> <20250411203828.1491595-4-elder@riscstar.com>
 <20250411220425-GYA22939@gentoo>
In-Reply-To: <20250411220425-GYA22939@gentoo>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Apr 2025 15:44:54 +0300
X-Gm-Features: ATxdqUGjS7K471piTwxJCgQ1FPFGZOtwP3hjSsRZXjBRtkjA83KwOfmLPX4aRGY
Message-ID: <CAHp75Vcmhp4rOSETAvM1u0UV5ejxbSniuwocMBmUd0DrO1Jp=g@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] serial: 8250_of: manage bus clock in suspend/resume
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	benjamin.larsson@genexis.eu, bastien.curutchet@bootlin.com, 
	andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com, 
	lkundrak@v3.sk, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 1:04=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:
>
> hi Alex,
>
> Glad to see first 2 patches already accepted
> This version is better than v3, thanks

Exactly! I'm not sure this series can be applied due to that. You need
to rebase on top of tty-next.

> On 15:38 Fri 11 Apr     , Alex Elder wrote:
> > Save the bus clock pointer in the of_serial_info structure, and use
> > that to disable the bus clock on suspend and re-enable it on resume.
> >
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>

Code wise this one is what I have expected, thanks!
Reviewed-by: Andy Shevchenko <andy@kernel.org>


--=20
With Best Regards,
Andy Shevchenko
