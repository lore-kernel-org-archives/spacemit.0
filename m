Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14701238C03
	for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204756; cv=none; b=UtI/kW96ySkTLH8HYLwFkjwqznEKrRrUxdOa5+GySlgZRzheFBBcF+tcLSuL60niic3US3p58PYDVLfINltjqmJTBELKmv9h/syzkkS0dnK6Vc0/yNMhq6i9bJTiQBtfzYuJmiGtMCvaUM/2R2EQGqb0n/Zc5GErawOyKVEXTf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204756; c=relaxed/simple;
	bh=vAzFJ4vqGfp1N5PM9i7xpuMtH/9hCVwEg7TaqBSdN/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3iSrqFNkmJv4NJUkSjXFlBH8Rid1MEiR2eEdMKa+yWAKa/DcGbz2kimOXGO3LvNlYxO9t2CbA8UdU0JD0HGZJq/BBZjDjdQ/6cZNnHihIwdS2NWT0impfazvQqDtRyxPV/VaNrUEou9jfVY952PAD+//zJYqWet1QYmFMYgFu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=m4mfHY77; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="m4mfHY77"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6446c2bbfe3so5227473d50.1
        for <spacemit@lists.linux.dev>; Sun, 11 Jan 2026 23:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768204754; x=1768809554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSAM4RH7cy/5YTgp+Z6CFhylkii8NBgRSJLcb1PkkO8=;
        b=m4mfHY77Cio1oA045U1jfcsZbNWjLpqiFwDmq4Mg/B3GbwPKcoM191LDo9iLIZJOEq
         r5Q+wl50lnO/+nQuAgQ9/9G3gLpqvckI/cwmCsHZ3kcf+ThXlf8xBdq/LbeiCv9m/kca
         dKvbRCCst5Vv6Up1/dYx6WWxSBDrmJRWbkXwLcDBGoPAWe0zRl7/10qA96vx5MULhB8w
         PpxpM4DK6TDJi4BhOi8WDi0CLEORYYxmzxQRTc+gto6hFcX2QZeW1lbWuSjBhVPnLBm0
         6lutYQcrvgi/TxcmSBY2WaVh+xXBnpjVHMM3sEXPXYy4cCPGUTUtVsQ2DUXBjjkh2gCf
         ECdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204754; x=1768809554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSAM4RH7cy/5YTgp+Z6CFhylkii8NBgRSJLcb1PkkO8=;
        b=uazQDgL7wy9YDa0ntueO1Hab4tyWZeuUF2BrGqoYBnEzXq1luSmNs1EdXM8X7zx8tf
         XdNvWvDPP9MTta41sE6VS5cJqph8ytOJwtZgRWUimv8xbBNy/wRmdLE3efG2aQn6wtle
         Q+vbVtS9l/y78G7lcZbwYqemSc+AdzaDyNeZsoJNpZMPuPPPBxZ3hp13u92ya9UNLX2d
         2roy5+m5RA+mGz3Fw2ruBhb9JuRXDOexgzDOCnQs/UUq5tkPBJDpvFmxWEUQAxK7PIKo
         nIWuKtJoaDvSdiBJ8CpjrqMWGfyCoEzqAEnxIIvGiqLVQbm3eE6m+EIJ5hhvI/Fw8oAI
         612Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLi0OSpP0w1EshLT6lj1jHBvsrA5B77szSKK5vYOZpgIv1dLd0386bIUP1VHPIhPg11d2iSNJRpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YylC6TSU/PIIPk9ChlvV85YoOGOneEdQHm4iDjrJf1BbNkAm8pD
	BBrCGuaigLWdzT8QZ4pV0Qa3gbqbalwuz2IlbaY9Hi9oSpOHsxwoHni4uIsqNfKgk0vn/J+f6UY
	ONSJaJMeQPjR1pWh5ixeXsWNNonbR9k1hkrgpXXQ2qg==
X-Gm-Gg: AY/fxX7P3TeLCgTnzJFQu25p4kWznC1nlezAOV3EXEGer4iJ9NIkybYS2duNtK1zDtb
	GCOs6QaJeeqMPiQJNj2M/3KEW6l4uw3/QT+BJ02gdvsYBNusyzZ/Xt3UgeYM44vWVAW3w0Ezdqr
	olbthfjr6rlRbHHMIL+esbqugIlSUw78CKD60xzu71XYYd3KOu8GnqoaRs8UrifQlFjYVoBXZ19
	lou7RXs0Q5+AQKQIkTX6F+SsaI2SD/zQvaTLRU6xF/DXFXdtFRKSQeDeg+W+X4hRSn6VjukRFWa
	3CZXLKmsKaRJjHa6+H0odbK6TwiDtICH+CDkAI5+2EjU
X-Google-Smtp-Source: AGHT+IHzovDi2wYX7QS5E17vTw6EfrmwMxXUMWfzaTca+VnZ75agggH0jw0Z9Nk1rpoyt6jY2b2DsuWSrr3IaSzijEA=
X-Received: by 2002:a05:690e:13cb:b0:644:ca2b:b64f with SMTP id
 956f58d0204a3-64716c0f720mr14418176d50.41.1768204753933; Sun, 11 Jan 2026
 23:59:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-10-d492f3a30ffa@riscstar.com> <AM7P189MB10095424D5EECEF98761C227E381A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AM7P189MB10095424D5EECEF98761C227E381A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 12 Jan 2026 15:59:02 +0800
X-Gm-Features: AZwV_QjBH78ep5ci-BN1t8eHhgINXSJDHXMbo8PMNGMoYTwSPL4cPXhT6kWXYBE
Message-ID: <CAH1PCMatYTfE58-O7ftt4dmr3tvssnD4UrSGEJSbHkFYgT_afQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, conor@kernel.org, 
	cyy@cyyself.name, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, 
	dlan@gentoo.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, lkundrak@v3.sk, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, pjw@kernel.org, robh@kernel.org, 
	samuel.holland@sifive.com, spacemit@lists.linux.dev, tglx@linutronix.de, 
	xypron.glpk@gmx.de, zhangmeng.kevin@linux.spacemit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 3:43=E2=80=AFPM Maud Spierings
<maud_spierings@hotmail.com> wrote:
>
> > +             mimsic: interrupt-controller@f1000000 {
> > +                     compatible =3D "spacemit,k3-imsics", "riscv,imsic=
s";
> > +                     reg =3D <0x0 0xf1000000 0x0 0x10000>;
> > +                     #interrupt-cells =3D <0>;
> > +                     #msi-cells =3D <0>;
> > +                     interrupt-controller;
> > +                     interrupts-extended =3D <&cpu0_intc 11>, <&cpu1_i=
ntc 11>,
> > +                                           <&cpu2_intc 11>, <&cpu3_int=
c 11>,
> > +                                           <&cpu4_intc 11>, <&cpu5_int=
c 11>,
> > +                                           <&cpu6_intc 11>, <&cpu7_int=
c 11>;
> > +                     msi-controller;
> > +                     riscv,guest-index-bits =3D <6>;
> > +                     riscv,hart-index-bits =3D <4>;
> > +                     riscv,num-guest-ids =3D <511>;
> > +                     riscv,num-ids =3D <511>;
> > +
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             maplic: interrupt-controller@f1800000 {
> > +                     compatible =3D "spacemit,k3-aplic", "riscv,aplic"=
;
> > +                     reg =3D <0x0 0xf1800000 0x0 0x4000>;
> > +                     #interrupt-cells =3D <2>;
> > +                     interrupt-controller;
> > +                     msi-parent =3D <&mimsic>;
> > +                     riscv,children =3D <&saplic>;
> > +                     riscv,delegate =3D <&saplic 1 512>;
> > +                     riscv,num-sources =3D <512>;
> > +
> > +                     status =3D "disabled";
> > +             };
>
>
> from reading the chatter on v3 I think the right status here may be
> "reserved", for elements that are reserved by firmware. But I could be
> mistaken.

Thanks Maud. Good catch. I think you are right, both M-mode maplic and mims=
ic
should be listed as "reserved" to signify that they are intended to be used
in OpenSBI, not the S-mode kernel.

I will fix that in the next version.

BR,
Guodong Xu

>
> Kind regards,
> Maud
