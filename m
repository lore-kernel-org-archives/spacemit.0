Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C301B3935
	for <spacemit@lists.linux.dev>; Fri, 25 Jul 2025 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753455825; cv=none; b=H3VmckJ+FNNUY5Cl1N87VuVNYJt2NYPtrV+/0FoHItbXX/8+6HKRQ534WCnaqN4XTBSlKxXsX6xshB16BxWJ4rDRzU39+LWewuOr8I0UKHd+/Ol++2JJBAvhUl5iBssP/JnOOQiPeN5qje4A56IvW2vjXF2ImiLL6krHISrZmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753455825; c=relaxed/simple;
	bh=1xCYL1gq/s7k6ckP//NsvFS7IG/FSrTtjXGsERS9ho0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHjRlkBP6qx1iJE+WlB1bZg6eg0K+o/+O64InXxAq6xWrP3J/RWM/2zqXPRRmqmxw7q4nOoPL3BduQTLyakHeapAwhm2ve8fiPbU344z8JSO2F4DHNcXBS4hsLRf7OW8hRmSpw6waXJwFiwwlnWwGKIm9fnBoAIH5JYOmyz1ezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/nSVoYT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/nSVoYT"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0e0271d82so433255666b.3
        for <spacemit@lists.linux.dev>; Fri, 25 Jul 2025 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753455820; x=1754060620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erS7uq3udGCfO5nHaYm38RMSBFxJNRFCMK005w5A8Qk=;
        b=K/nSVoYTYYIT8o42o+Y6OgSzQYlenlV6g4TvU3DXE3oqb+oBDqjDDrsufdq8HRsXDq
         7sjQVRMuaVCCSJA+wXYTcborSUu/hnfwPxdxefwY05tbeGaPX64mwF4JbpRzx//4uFDc
         WqhaWYMna6QhzA/mmYN08nIH2F1U2E4Uc37ebGZFbfT4uPFYWmMJ67A9PEU8pJOE/8yY
         wsJtiKEy900tGX6Y/AYj9VEzq2UUs25WVKX11CFOkHBDvpq1cEFrMSALMbnhtZ1sumPI
         Le5Q25BYXmez0lAKBqhvwIoo1Xydg34TepyRuSGwmKSPM6rkwORbGYFck6x2STGr+l0N
         fNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753455820; x=1754060620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erS7uq3udGCfO5nHaYm38RMSBFxJNRFCMK005w5A8Qk=;
        b=mJ0iXHT7gul0oCBx+s+uME1xA45vEx0maeHXJsFqXLiYkt+HRU8+PbqLxLdOFtXQhC
         SuA/5tFnAzQPqqwm9JEKEW25ZJ+0GjE6YPICZaP02s57A27zgRj2C5g8avv7MRRB4Dh/
         bSaRukVy5xRHzyzNDM7hkQfJlwZwhha5LbJ505z8rprR/ZS9sZP2k3sd7jjkv93fgo+D
         WGwqMNQfi4RupgWwwMRYokme1S1pfbrA8Y6egjmEyocDUVcuUecxCbuhWhxd+OmbArZd
         ba+w4Mx7yJU/y5/gvgJwdHAbLtgSl3/Y+hL4nI6MH09fHe2SD4nBd/OKycg2Dql6yc4Q
         WGEA==
X-Forwarded-Encrypted: i=1; AJvYcCW0J2GiZ8odPHduCizC6Eh1I3R7B4cHcZdJDEu15wipK8lFbW67j0fyYdwZyeJM9EU4FmSnfv43mA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxU+jneHEJZmMjqKFFwK2vDRTzIQ/FQEWYn8+MGYFLN2ajRJEWS
	2q9Ichj2pg8HzNElhEz4oUfVqW5MHQy5vVHrY4Bge6qyAPCDNfVj3g2KKJ8U5S/QJtkxzx7xu7z
	AZwRaDl4yDiJlWWvTey0rJ7HDhPQ7q/w=
X-Gm-Gg: ASbGncv/wx7YbrpCyXM8ZoPZZ7J6iCEwlgwPd7Q0knThKYkELrPg50A1TerTW8PfrNU
	lNj9jWuflAqWC5WPL4jdQ4XNUE5z6LPcW5g004bDC6slmLf/2TN2ZdEez2jCmSXal/TfRgUKBHS
	5a4CDmqNKkSdi2gTfGBLou8XUFDI0LSyb7USNjEnulXcg6rrk425QuCPtB0pXBXL3LDhw9VAJK/
	B2y
X-Google-Smtp-Source: AGHT+IHGfS4PKdttSchEGmgyuX1Kywz/fBalH2X8p7gNn6r8V46aaJwbraqbv88gDObf9rt2X3E0glQHYih5p35dMYw=
X-Received: by 2002:a17:907:7f0b:b0:ae0:a483:39bc with SMTP id
 a640c23a62f3a-af61960265emr269272666b.46.1753455819042; Fri, 25 Jul 2025
 08:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
 <e4d9cac8-f7e0-4f69-85ac-19cba4a612c9@riscstar.com> <CANAwSgQKQUxejwPTrsn=VgDjrsQc4qvKBrVJeWOirf-EtngDFg@mail.gmail.com>
In-Reply-To: <CANAwSgQKQUxejwPTrsn=VgDjrsQc4qvKBrVJeWOirf-EtngDFg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 25 Jul 2025 20:33:21 +0530
X-Gm-Features: Ac12FXx40DUQdalB_A00prV9fyKpQQ8r_85tTODBZycf4BQGm1iLuSo9HpqJj6w
Message-ID: <CANAwSgTkoXzrBs5oDYsef5zNGL_2kkazzJLpFo-x6XtXx-nXTA@mail.gmail.com>
Subject: Re: spacemit: P1 PMIC support on Banana pi F3 testing
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, 
	"open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex

On Fri, 25 Jul 2025 at 15:19, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Alex,
>
> On Fri, 25 Jul 2025 at 07:26, Alex Elder <elder@riscstar.com> wrote:
> >
> > On 7/24/25 4:56 AM, Anand Moon wrote:
> > > Hi Alex,
> > >
> > > Thank you for your work on the P1 PMIC patch for Spacemit K1 SoC - Ba=
nana Pi F3.
> > >
> > > I've been testing your patch series for the Banana Pi F3 [0] to enabl=
e SD card
> > > and eMMC functionality,
> > >
> > > [0] https://patchew.org/linux/20250710175107.1280221-1-elder@riscstar=
.com/
> > >
> > > While debugging, I cross-referenced the patch with the BPI-F3-V3 boar=
d
> > > schematic [1]
> > > and noticed several discrepancies in the power configuration:
> > >
> > > [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv=
/view
> > >
> > > Incorrect Voltage Ranges: The minimum and maximum voltage values for
> > > multiple regulators
> > > (including BUCKs, ALDOs, and DLDOs) In the patch, do not match the
> > > specifications in
> > > the schematic's power tree.
> >
> > I really appreciate you checking this.
> >
> > The values I used were derived from the vendor code that I
> > started with.  I was assured that this baseline worked on
> > the Banana Pi BPI-F3.
> >
> I am just following examples from SoC like Rockchip and Samsung.
>
> > For the record, I *do* have a functioning SD card and eMMC.
> > I'm not sure just now what you are using differs from what
> > I am using.
> >
> > I would like to understand and reconcile the differences you
> > point out but I'm not able to do that at this time; maybe
> > next week.
>
> You are using the default  ranges  0.5~3.4V@3.5A.
> But in the schematic's power tree, components such as P1 (U1401) and K1 (=
Uxxx)
> specify precise voltage ranges, for example:
> 0.9=E2=80=AFV=E2=80=AF=C2=B1=E2=80=AF1%
> 1.8=E2=80=AFV=E2=80=AF=C2=B1=E2=80=AF1%
> 3.3=E2=80=AFV=E2=80=AF=C2=B1=E2=80=AF1%
>

I might be mistaken, but I came across what seems to be the SpacemiT
P1 datasheet [0].
Unfortunately, I=E2=80=99m not able to understand Chinese.

[0] https://developer.spacemit.com/documentation?token=3DQ4uNwF9a6idIo5k9U0=
AcK4iXn3b&type=3Dpdf

I suspect the driver configuration might still be incomplete, as there appe=
ar
to be certain register bits that need to be set for proper functionality.
That said, I could be mistaken.

If you have access to this document plz share.

Thanks
-Anand
