Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EA123908B
	for <spacemit@lists.linux.dev>; Fri, 25 Jul 2025 09:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753436981; cv=none; b=nIfe6bG2zX5IjF+cXvn8NfJMRSWPZq56XY7P4cQpMuHkgXixDI1NlVDJBjPMkPpVFG7QWCyugi/k6S+LZs/NNHNRr7IJoHiTZjwGKRbxYpdTxkzoOOq0J/+Yrar17CmnEGHo6OwM4f+9GDCXuO18ax+IMUGcxWIIZCV8fuRzxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753436981; c=relaxed/simple;
	bh=rbCYsmE4y4vXSnOXsMUSIIR/vNbm5Dqw5Q/fC5ixxPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEeIHdkE/Q2PCh8qKkgdL1J2ceP9sOQENI9FBd85e5e7fUIsRdhlb1jFSJaCXEPc4NXf9zIkngbbLXOpXBxss9XsLZq1k22smtfALymHhDSf7YYbikfP+xEdo+cwIvqLiKc+dXHuNGUfJcACTX/3dT/78MaZkyni57wLMU2TUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlGz6sTD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlGz6sTD"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae9c2754a00so328724466b.2
        for <spacemit@lists.linux.dev>; Fri, 25 Jul 2025 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753436976; x=1754041776; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+QogGvDSzP05F9z4DFbDysLCaCmeaQSN6DrVd5j6fY=;
        b=JlGz6sTDvPmfqWopjq6pNuYahnznUggsYzCnAkMhCT4101o+muisQWzi2uonLr7qec
         /s0uDOcERP8JlFQep4tpULDVCOvxucfwypPgSejGQGUwLz0DSNsQTGNnlJv7lbC/0Ken
         GsFOqezo0UeKw7Ll4IcajV8YtjJzIAiyu47oaonkhPb/S9XQSkRcPs49Ni9JltnYthg8
         5WEgPyIIvNqXIPAJNxdStMKq1mxK5mm3E9wfvkF97CqXTimSZYIHYVfOTe1Rly2tuqEi
         KXTxIouagYoFZf9xbV+TK48n1XAJ4xdl7bWsRIt6feEkIxmsphfPPpP/sMqWNNvZsZST
         6PhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436976; x=1754041776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+QogGvDSzP05F9z4DFbDysLCaCmeaQSN6DrVd5j6fY=;
        b=LRm3nrgZt9Odj0aQ6TDFQ00vnUCI7s6VJ/UCCFqCBOWQ4/vee8OPRGHH6YcNCo0qf+
         sKItv9EuLrtXS+sptVSH+Lniy9wm0muA31NBmL4XS1OhCvr6iN7hZwAm/eohKqsYaArt
         DWUOsPQWOyzkzyZnNll01tLY4pMO2iadkOj3MIZKkp4GTq/wJsGcLLxxoYFwEx7va808
         iwOTk5FF+9XavKI8JXNxvBaew7hMV6DJZhNLftLqTiSgNSvI82OWdmhPpDcgYPLbpwU6
         d1wkiUzF5PiAns4Y5KtdBet93Bii9M8M0p/m0PHKSx5ruIeIf2ZOyqrgTnuW2Ac2VfFo
         429Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjcH9CJmcUSHbr7OAKK81865qCSRCdnIgYCTrZk4g+kPvUWv7GBGeRFUeylNIL3jmP9ygG0rWELQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaI1alCTZ0uA+Fl5fC0QiwovVsVn4EGxYOrMLdceKMzD7n3gIL
	uoq8A7TVur+8cIOq121JoJk/vw4QrIpafjN6tFHAG6zycw17F4FTXpJYhqlVhludE8pI4R1UCZ4
	BEtW50bkj08UoPVtvPfmkPocejPdhrpM=
X-Gm-Gg: ASbGncttcTDDWAzRoN56bLwW9dnRI+rSoJ3x6aSCc0XCDwEWxVMKZqB7aFyCaNbQmV4
	0F3kn1pcHcrqEXLCyqPHgsbyO3V5iEFfvzI1sstpdqNsXz7+kmuS2psAXz4d7e5r+VRJ2zphVpo
	s63WPCD9oKf1b8bFpJMyzfgU7IhUJSob034RRnMHOZTML9NgDNfBHmslDt+1NpmLBUCey/pJWN7
	kzK
X-Google-Smtp-Source: AGHT+IHbQhmoPTowDtuv9MyQr+06tJmA20b2rQw8QzJfj9UkT5NQyxB3bOjfSQshD1HsIkfy6JYzIIixC3o72OjLS3Q=
X-Received: by 2002:a17:907:96a4:b0:ae3:5e2a:493 with SMTP id
 a640c23a62f3a-af6196064fbmr155836066b.49.1753436975879; Fri, 25 Jul 2025
 02:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
 <e4d9cac8-f7e0-4f69-85ac-19cba4a612c9@riscstar.com>
In-Reply-To: <e4d9cac8-f7e0-4f69-85ac-19cba4a612c9@riscstar.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 25 Jul 2025 15:19:18 +0530
X-Gm-Features: Ac12FXyLmbtHl6m_gAHAKxjdQmSiJjupIJX-J6mWVKAmZAYjo54yCmxxq2UJkcA
Message-ID: <CANAwSgQKQUxejwPTrsn=VgDjrsQc4qvKBrVJeWOirf-EtngDFg@mail.gmail.com>
Subject: Re: spacemit: P1 PMIC support on Banana pi F3 testing
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, 
	"open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Fri, 25 Jul 2025 at 07:26, Alex Elder <elder@riscstar.com> wrote:
>
> On 7/24/25 4:56 AM, Anand Moon wrote:
> > Hi Alex,
> >
> > Thank you for your work on the P1 PMIC patch for Spacemit K1 SoC - Bana=
na Pi F3.
> >
> > I've been testing your patch series for the Banana Pi F3 [0] to enable =
SD card
> > and eMMC functionality,
> >
> > [0] https://patchew.org/linux/20250710175107.1280221-1-elder@riscstar.c=
om/
> >
> > While debugging, I cross-referenced the patch with the BPI-F3-V3 board
> > schematic [1]
> > and noticed several discrepancies in the power configuration:
> >
> > [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/v=
iew
> >
> > Incorrect Voltage Ranges: The minimum and maximum voltage values for
> > multiple regulators
> > (including BUCKs, ALDOs, and DLDOs) In the patch, do not match the
> > specifications in
> > the schematic's power tree.
>
> I really appreciate you checking this.
>
> The values I used were derived from the vendor code that I
> started with.  I was assured that this baseline worked on
> the Banana Pi BPI-F3.
>
I am just following examples from SoC like Rockchip and Samsung.

> For the record, I *do* have a functioning SD card and eMMC.
> I'm not sure just now what you are using differs from what
> I am using.
>
> I would like to understand and reconcile the differences you
> point out but I'm not able to do that at this time; maybe
> next week.

You are using the default  ranges  0.5~3.4V@3.5A.
But in the schematic's power tree, components such as P1 (U1401) and K1 (Ux=
xx)
specify precise voltage ranges, for example:
0.9=E2=80=AFV=E2=80=AF=C2=B1=E2=80=AF1%
1.8=E2=80=AFV=E2=80=AF=C2=B1=E2=80=AF1%
3.3=E2=80=AFV=E2=80=AF=C2=B1=E2=80=AF1%

These same voltage values must be accurately reflected in the device tree n=
ode
definitions to ensure that all regulators supply the correct voltage
levels to downstream
components. Labels are used to map each regulator to its corresponding
internal node
in the device tree. Using appropriate and consistent names allows
these regulators to be
easily tracked. This mapping helps in validating configurations using
the regulator_summary,
which displays the active regulator states.

For example
$ sudo cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage
current     min     max
---------------------------------------------------------------------------=
------------
 regulator-dummy                  6    5      0 unknown     0mV
0mA     0mV     0mV
    12500000.phy-vbus-boost       2
0mA     0mV     0mV
    12500000.phy-vbus             2
0mA     0mV     0mV
    12100000.phy-vbus-boost       2
0mA     0mV     0mV
    12100000.phy-vbus             2
0mA     0mV     0mV
    12130000.phy-vbus             1
0mA     0mV     0mV
 vdd_ldo1                         1    0      0 unknown  1000mV
0mA  1000mV  1000mV
 vdd_ldo2                         1    0      0 unknown  1800mV
0mA  1800mV  1800mV
 vddq_mmc0                        0    0      0 unknown  1800mV
0mA  1800mV  1800mV
 vdd_adc                          1    1      0 unknown  1800mV
0mA  1800mV  1800mV

>
> You say the names don't match.  From what I can tell, your
> names are like "d1d0" (D one D zero) rather than "dldo"
> (D L D O), and what I see in the document you link to uses
> all letters.  If I'm misunderstanding, please explain.
>
I might have used an incorrect name due to a typo earlier.
Based on the schematic, the correct regulator names are BUCK1, ALDO1, and D=
LDO1.
you can use it accordingly.

> Thanks.
>
>                                         -Alex
Thanks
-Anand
