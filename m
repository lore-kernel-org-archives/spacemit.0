Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C913603D3
	for <spacemit@lists.linux.dev>; Tue, 21 Apr 2026 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776756489; cv=pass; b=f5V1q38Lb/UaGb9sGZ2Knq3e25tKeoaQlcNjWE8GSydXOdSXnMfa+QuOo8psyxD5AZY1PAg9PrPJM0C++9oGQvNe8tZ61RKSwCnUEwxUJeeeKUvb53159OJIyDRs1RjtIB212mlDvP3oTv7/LV4Y4JUAE2g2dEvcHE67E1xuees=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776756489; c=relaxed/simple;
	bh=SrM7B4xlCRXqko7TjsJdvgDkD2L8BaoWfnbPWdalSd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PGfWeB3y1BMTjXVfi1Bq7BHswF8r6/73PlsikJIFJWSX773xDBsoZLR7HdgiuYbofz16mZSN+tpU276cD9xHpKastt3iDHIV3UYhH9XGQrz3V9aFOYGdIVdEq/LpapWvZtlqyuk7SQbaF4dm/JeSCUPD1ncwjvC4cK0pLxTODFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXo+iFh0; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXo+iFh0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9c9d03524cso554162666b.3
        for <spacemit@lists.linux.dev>; Tue, 21 Apr 2026 00:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776756486; cv=none;
        d=google.com; s=arc-20240605;
        b=Y4TdKF2Fk04l+Vwx3UIfh6D8qQK/EVYaBKT783q5IcvthwwqGJRfXflCeEfVEnX+LC
         YmYiUG+cj62uTqu4hJaJrRPbJmHqzgZo9/egRQFqG+dSh3sE3MbOcsGvycqRn9XJv4KO
         UxZlaQmSDOWPGn0WjwnxsM/BPMhUvoBJuaVIZMew0/ndZ+pRvuPA2KIwYeWlhprJmhvz
         A/Wy7Nfe5gxBAd6FmxZSLLNZErgGEoR0WJKQlzbUZM6zw/mWnBFYuMIZc2s7MxD+NWGg
         iccJSv7t4Bfz99ixdvGuDgYJ4ZSLqeBwxjmIDgmiW2I2QuwdtLDDplOiobsj9CUA8eJm
         XANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Ql38lC9ZYoXrn3/+8/I12f47H5/KcGWLQDIbsninAQ=;
        fh=T24FB1WAtJD0hs/hRHukz9A7o7OvTvgfC7P49PAsPLg=;
        b=YKzNQb1uPq07B5UNXJPRkvBr75neEpl0HPw9jYOq0S2jKsn6LK4QfoFFT1kfowrX07
         cB1V000IkE2ur6EVhYcYagWRvTK9QjLNF4YY2dWky1XkWb5pF4rscwBvFt1E3DtnuHEs
         ODasQUsGiKRhkNMakp1GZNFXMi6lcdHYwSaLMMCr2jQhK6o3PdL82a2kJfbzFy/MCOYh
         Og6310KoeBhyauV3IsFLY4mC/J4mCN1epVJuD+5n5c2uyVza8qTDUXTVIK9H2ZpwkJNu
         elO53Lj756STC1Z+VF9/JbO33E7Znkf3Uz27DeGEU+Rf8w57liKarCZqkGJkHrVUp5p2
         PrsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776756486; x=1777361286; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ql38lC9ZYoXrn3/+8/I12f47H5/KcGWLQDIbsninAQ=;
        b=bXo+iFh0TqBtPRerOt1ni9PaJEPm5cm5c8VG1A85kwxIE90XQoPPFoGC3n4qbwZ9Pt
         /ACwcfOg74sS+igYKoJ8lsKYie8NZ4QJUMKTYko1GLxJGXhQdgdBHHH3bD2IVdAvE286
         cLvt/hu4MfflAJdqOmRXQ7MCu6SnXVSbd9q9GV0VKSQo/sn6tWRqRoFcuqxFye+vRecR
         RI0KgSw00PKppgVeOcE3OOgheyapsgDZYmzqRVwaU48Lif8RNMignJd8treCXQeplpzV
         QzUxCBCoaYiS0oKuV04ZI6qREEpBz5sbuF+IIeTpM1lvX+/D09bOvioivE7c+r9HW1Nl
         BACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756486; x=1777361286;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ql38lC9ZYoXrn3/+8/I12f47H5/KcGWLQDIbsninAQ=;
        b=QmleRtNampQYcBBHBKdrfeixrC4z5gGHpQ06Scj3sdvs7lG59qDOVnnxYRWPx3BjZA
         RuGeRvzLJ9ZYWIYrXn7870o2S2zOTyYzxoHM2ZX8nXS51aeVv7ZuK4S2SXOnqtBcb4x1
         W3ytqyuMOKLnbHwKu44hDbYndZONITXXXxgi9Yuo7V6GWF+2OazudJjpswlzgNwbWIx1
         7fVI94Jaz2LKhpIz0kouk2RGGi7sUfDc5JcODeAA021HXyH7Ogc/CSbZtvj3UNb9NZpQ
         lLDrWWSc8odV8dRmkjsyH+q/fABuMSCFLByTZ1788007hBXZWTYQ6peHCHg3hFzA1q8z
         SO8A==
X-Forwarded-Encrypted: i=1; AFNElJ+MOiZ3Z5xyoqFmVJ7GC/jKQ/0D+kb9v+TIo8IKYq+pV6SKEr3XgSRjtp0/gS/EWPnaFQXuZ33h0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv9LMQiNlbCvUfug6GaFfXOkTOtMZB9eus70k8LtLd66aEqjlt
	fSom3LJWgeN/2WFeuy4rQipY6AIz6mQiJV3Dz65HN+pjiw8ztgpxm4SHxeV4s0KkjurEF0y7dQT
	paO3WI5m2S4fkt97jJnOkd4u8XA3c6Qc=
X-Gm-Gg: AeBDievWN6e75QDLxdfLTi2Ys4O1OdpQYEoTVcpoXQGX9qaZF2MbeK35RD7/WRLh/fC
	CkeJYA/1anif7wNCvsp98CQk32jSG+9VadmBbyoYoH1zjVEJbUA+idJYWcdPc+18OJsNthEiSGU
	MrB+Aaw3J+GuPoKesUeQroi1kbbX2U++zTmh7m6+UVx5fycDtosHokjDz2XOgTqPNv4W+cu7RSO
	kw7x5ynApgT40zQmgUWNUJLRcfenZzMC7dMwoVt2ycAJnITFMKM54cgYOmtGNT1zZipKsbXq1KD
	JOb/xuPdqh8wG08=
X-Received: by 2002:a17:907:3e10:b0:ba8:61fb:a927 with SMTP id
 a640c23a62f3a-ba861fc2f3emr295974966b.39.1776756485914; Tue, 21 Apr 2026
 00:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org> <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org> <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net>
In-Reply-To: <aeaXszeaE62rM6BJ@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 21 Apr 2026 12:57:50 +0530
X-Gm-Features: AQROBzC3b4LUDC2_89z11CxE5Y66IyoxVuaubMCzdKHl_KwSO1e5I3jSF-QRINc
Message-ID: <CANAwSgTXwhkV=QEJqzY3WYV9+uy=6zEN9aEktinswFARs+m4sg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Anand Moon <linux.amoon@gmail.com>, Shuwei Wu <shuwei.wu@mailbox.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aurelien,

Thanks for looking into this.

On Tue, 21 Apr 2026 at 02:46, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Anand,
>
> On 2026-04-16 17:07, Anand Moon wrote:
> > After reviewing the Banana Pi F3 schematics, I confirmed that Buck1 and=
 Buck2
> > Both supply the CORE_0V9 with 0.9V=C2=B11% rail. To resolve the restric=
tion errors,
> > I expanded the voltage range in the DTS to 500,000=E2=80=93950,000 =C2=
=B5V.
> >
> > Additionally, I updated the DTS to map the second CPU cluster (cores 4=
=E2=80=937)
> > to Buck2 to better align with the hardware's power distribution.
>
> Actually the output of Buck1 and Buck2 are connected together, so they
> should always be configured with the same output voltage. And both
> clusters should be mapped to both outputs.
>
You should review the regulator_summary below, as it may indicate
it could be Big.Little architecture cluster.

$ cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage
current     min     max
---------------------------------------------------------------------------=
------------
 regulator-dummy                  1    0      0 unknown     0mV
0mA     0mV     0mV
 dc_in_12v                        2    1      0 unknown 12000mV
0mA 12000mV 12000mV
    vcc_4v                        8   10      0 unknown  4000mV
0mA  4000mV  4000mV
       buck1                      2    1      0 unknown   950mV
0mA   500mV   950mV
          cpu0-cpu                1
0mA   950mV   950mV
       buck2                      2    1      0 unknown   950mV
0mA   500mV   950mV
          cpu4-cpu                1
0mA   950mV   950mV

> I also wonder why in the original patch the buck1 regulator is named
> buck1_3v45, from the schematics, it should rather be called buck1_0v9.
>
Yep, you are correct., It should be called buck1_0v9.

> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand
