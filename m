Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE322907
	for <spacemit@lists.linux.dev>; Sat, 12 Apr 2025 04:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744430470; cv=none; b=LMsHg0zHm48BNdnW9YuB1IBLF2qyBKCjyXxEFnVezalXTBSIDsqFYEo5ifR0YKIG8sBL8sYxyumxcVfFFpxZmJyj87m/DrQ3Trpicc4fS7RbD2Tf1ReYk0SmNz11vMDziNW7jnp3h6puVwo5k9hwid83OG2vsC1Go7np78FgSxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744430470; c=relaxed/simple;
	bh=/oaDy5SzWfzyFBs8bTU2LHsjy16/G0IhlbubH2Ym338=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/wx8jpIVv0YcZjW78JFzhPTCQ9Lx8+XblAT+dh/PI+RGuB/BLwegpMwP/n7Kf6CxU6+S3yXXMC0YVi7UHLnlu1gVYN4DMpYMeGd9voVTNMQbChXgi8G/wMi4BXSmhhBszFvllnm9NKDwSqyaoDDbYqFSfYeT2xLrkiRjkF3ylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=q6RgWMm3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="q6RgWMm3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso4157160a12.0
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 21:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744430466; x=1745035266; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CRPWfzlQeNRznSdwAcCFwL0YU/Q8vcd3a6wdTbE3VY=;
        b=q6RgWMm3E8XzLmE0RW7gU+QJDi2A7bDAz948I1BLQa5gqWQFTsKvIW7W/0crdH1eUc
         GcoETzdngX1PyEElMMAWbIbB8hmpPaXfpUgSDR0TDCekKY42AtFOV1k93bwQHIwFDDpp
         qiBC6AOQqxiAtFZ9BnFxMrkHGhU5jKNSutdQPpQnF6aF9UPnv7jcaF/zI4npCftGEOac
         veTSyAhrqhf8tAz8lfLMcjViGsI8aaFr21ZANAF6SkXkp/Tko+ZVrMimaUQ5GzZPvvn3
         5XhJ389XJQAnTYOlyk6UgItIQISf3K9Mwep76ErHMrP37kSR69i7MfmVqAQ2iUAoxpqP
         4JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744430466; x=1745035266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CRPWfzlQeNRznSdwAcCFwL0YU/Q8vcd3a6wdTbE3VY=;
        b=KMp4fbxWX5ibPqiNFUyrHydhiGk34D9mc6DViG6py5Njov4+wH/slO3d2X5Ckq1URE
         L6T0mWkHIujJaMU5xyhT+g9mftkBcDzj7FSlQ+3045rt9B5PVTUJ+oVaMSVEE4IWgKC5
         i1OJcAdhFMIv9HS4DBaQPkW8fwCPJWIgaOaJzcYY+HyiviGI8NCp+VRxiW//oUYxaR3j
         baFBOKdFt9FdeK9KghJGXV2jhrzyn/8xg9idRFUi2jITJvVdHtgIo+l2rbBqfizRSVi5
         N9d/aZY9iGVBpHOSZ060a7L02EFtc5QFYnhKE5AolcvilwvyAr+DxKfZxZoNTas7V0iA
         xPMg==
X-Forwarded-Encrypted: i=1; AJvYcCWU/40hWixV4GN9kqTyoadlni7EeGSlnd9qqxNr1nVSMSy/9EM5Za5qC9u+DjvI2CzNQkI9fWRw6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8bX2WqKH2ta89XOo8PwINNylxP1AZ/IBBuNwS72/zydtRs/9d
	GOT7wvpxYxHgAuYAV0FtqT6r1/ykJdv2IAZqSyAQYVtCAk7GCheke7+WSeW+DfRAI56FghFRb6W
	flbiM270eLdipptC+M17TjP+0J2FQbPT00I4jng==
X-Gm-Gg: ASbGncuy1FTyQApohQ9H+6jGm9a/rf3hVqm8M0/CHBw5IErNOO2liH17k/fBF+P1gxq
	6rOUezAaKyoskljV2igSRamwNUuk3pr42SWP+GhNdCaImaCySDsCT0bTT+ali31YJp8wbtSxThg
	DhoxGOxlsic/3mH0I8n0o47s5hsg==
X-Google-Smtp-Source: AGHT+IENp9Rsn1tl1gtpbQVTMzSC6/93PX9bXuEoDkAlRHWwSvf7X/I+LUs0PiXsS9JvQ3CIAnw0CeEUzESATSMDzW8=
X-Received: by 2002:a17:907:c22:b0:ac1:e881:8997 with SMTP id
 a640c23a62f3a-acad3445eb0mr424260766b.3.1744430465564; Fri, 11 Apr 2025
 21:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-4-guodong@riscstar.com> <20250411-spoiler-dispatch-8f709700a996@spud>
In-Reply-To: <20250411-spoiler-dispatch-8f709700a996@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 12 Apr 2025 12:00:53 +0800
X-Gm-Features: ATxdqUGgkB-PsMfv6YqmcddOd__4CXMlcvN5r0cbFMC6NhGoCTmz_wliYFT0jOQ
Message-ID: <CAH1PCMZcevte5kJ9PUO3cvoaFwdido=WboNcLV9dTk9SJuLGBQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: pwm: marvell,pxa: add support to
 spacemit K1
To: Conor Dooley <conor@kernel.org>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, 
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 12:43=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, Apr 11, 2025 at 09:14:17PM +0800, Guodong Xu wrote:
> > Add "spacemit,k1-pwm" as a compatible string to support the PWM
> > controller on the SpacemiT K1 platform.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml=
 b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > index 9640d4b627c2..1e3cabf6a89a 100644
> > --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - marvell,pxa270-pwm
> >        - marvell,pxa168-pwm
> >        - marvell,pxa910-pwm
> > +      - spacemit,k1-pwm
>
> The driver doesn't appear to handle this differently to existing
> compatibles, why is a fallback not used?
>

The only difference in the SpacemiT K1 PWM controller is the addition of
a resets line. This property is not used by any existing PXA-based platform=
s.

Since resets is defined as optional, I agree that continuing to use
the existing marvell,pxa... compatible string is reasonable.

I'll update the next version accordingly and include an explanation of this
decision in the commit message.

-Guodong

> >
> >    reg:
> >      # Length should be 0x10
> > --
> > 2.43.0
> >
