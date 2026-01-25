Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073D818C008
	for <spacemit@lists.linux.dev>; Sun, 25 Jan 2026 04:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769315273; cv=pass; b=rDN4hwDkqXK0swDt319OYXvLDH5yuo7FEO2ccucUYenhws+1mUB7yPONU2LBi8w8xExtvb6n0LecWrCApzwwtZw7arDtrJ2L2S3v3giywS8dipT2PsIURJV09F9EC2GdTwOpZSrHQiNjl32WoztRseTNCsK8h+K2BNm5UJrQ4WA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769315273; c=relaxed/simple;
	bh=743u7qbXka857vHX8yI0E82zy/lRytA6VvRqVxxVda8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnwCTxYrZUY8TGj5Rr46gWUd6/cuKNffF2vWCvALxEIq4Yfz0z12tXatz/GkvxXSAyJcvgCPsGZpE38+is9vkFGqpz4sDWokMvCnbzvOBE2EuI6oiNk7M/D7U8rraPZavX/JQTZU+/Xh1B1Db5A6i1bqeDOI1S/PRl9rOmh25Js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=PPyKXRlQ; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="PPyKXRlQ"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6493937c342so3434121d50.1
        for <spacemit@lists.linux.dev>; Sat, 24 Jan 2026 20:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769315271; cv=none;
        d=google.com; s=arc-20240605;
        b=EAkg36d7Pzy7KD5UuOGDvts59DQr3xGs4Srsu4UryuINwFjIJfBZ6cDxkhkEgLwYwa
         W6lIdZI6CLWrkhSyZ0BvrQ24MuI3b+7AyeNsICZQlOQrrv0XHLVquh7jf63mOeatqPmV
         zyXuq7DwkDmYHxzNLrKtoA0u/rUXrDT/vSdFLtLjtPeN4WV/hzX31fnHzEHffxGwy/Y9
         PLza0MuSriH7haErib9lD3uYbePi3RPx91hdQwnz3iTa/kwKUU29cyERWxyEuUCf/JeG
         U3b7CR2TeoLW8A9Xbb3ug+pcY5qaC8ys4kdC8gVjlYZIF1AEh5wX/L2ZXIgfm+28jKo1
         KYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=743u7qbXka857vHX8yI0E82zy/lRytA6VvRqVxxVda8=;
        fh=2UMcyFUWY3BVVQG8ZrDSD8r+mdIlyQjqthGcIsyxzvU=;
        b=i+mLcK6n77lRs5f2+j5bzFyo7m5z/IL1MDX4zjfJ0jxVkaGXMVQh6gg4x5R3tPC3eH
         4mq3t8e/8UG4MtI7r9GRWLuS+ONRj0BUGpSgQ6gbICIrklB1DYn2Xn3siZlXrMq09eel
         vPQp+oJH4LERAWajqxxck5ZUk4Duq9q2MB4jLKJhTV8IXfPOaPwxatlWG0HiO/X/MUmp
         28WheUlJtrtX3/grEoWX/W5DFrN+xCVdGM4Z6mHhkS/NSwP4Y+iLXbaqpMbfwovBFn8M
         7W9o66/WT8KvGAihVLx8fagdj093vLFax3REDq6cOxGNUkhv+bBCXhT48oNlE2TAQZSV
         2x8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769315271; x=1769920071; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=743u7qbXka857vHX8yI0E82zy/lRytA6VvRqVxxVda8=;
        b=PPyKXRlQ6wWWAAiOIMDCTE8SsvXMwyOKH0c+r5QuAk0aFHClk2yighhtWTAq63XhCx
         3u7ZJjrwX/tZbyFb1Za8flCQ9X8+hU2IHzI7pYWK6oIng718i3g8ipnltky+puxGIBj1
         6d41Ltd+36V2psbcjYUzr2GHKips3BjzLQ1jz4l5IUM8Ob+7JnNo8T7xR4a4vKXEHBjn
         +12nynywD4rr0YwEds2XiUhOO1Hv2jE0/xmPKRXoPpPtjd4/8eHDYn+PE1s+WGF+dqaN
         defRMc9zuMQCohnsGwQzqFtHwD9zuQlmlgq/kNhnJJv8c/v+VlLD+CJjvtueNTqDsz0J
         q+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769315271; x=1769920071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=743u7qbXka857vHX8yI0E82zy/lRytA6VvRqVxxVda8=;
        b=erGQc+PmMlxnfp1tg/59HIaSRyT/N7iJhD8wAsKODW4x1ZSdGVXBYsAD1MKjB6Ycvh
         trcUCUkhRB2U0aGfi9jZYSAkJR+p5bt2Zmf8+Nh6Ku818JD6b/uJnU6d+CtntYzEU8AX
         mP3qqr6b4h0WJjs8AMHP7FBn83osJ+P72CvJTe+EsBJ4ObRecUmo51rg5KC69wFec1LH
         /GOGNlN5G1OilZfciCsCbBQm4jPo9K6+gQ4lzSnV1BzhecqNxayGtGn+aSTudFZ1j7ok
         BqWe24agI+IFt2NDULZo9v6d8dNuBOdcp27RJSf86O39R44gzwBW3IehF5jFzSfuozks
         jKWA==
X-Forwarded-Encrypted: i=1; AJvYcCVO6PFZCgMu4CHa342gPKWd3gnHs/f5wYwfvuxxP+FpJ2g3uvrTJ8EmRX6jm+CR0COk5BWKK5HMLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzTieb6kC4ZkYcYUf7nunRxcBpW/DOJAeI5kYFvaaYQz+idDwC
	g/A4t62JjW6aBk/jCQ4DeTaIYaSmtp0tmQnu387DX18aL/AlCPUdN9xstLrO3YF2AzJd0RcEMKx
	aJMuEdABxjikBLmcJeGKfvnrpY97ewTIggJIg/74RLg==
X-Gm-Gg: AZuq6aIawEOWvm21fJWztSX7IardhuE3O9LsPFpWEskbp+Sv2KpjYgJh06vsMhdycS3
	xu4Si7VOMPE7V6rwRg4iiHIJnkG0IDyjsaUQtSVVJkCJEutSIKqXF7Ne1xBrYEHCPbahtmFIPyZ
	H/lqQC4Ft3puTWMEMLHqxM5LdEFu77b9jk6SEsGKXF8CYfV7nx5s7c+ZfX2/U4ktkseP7l8uCw9
	CBil3HZDTXDcFiz/h2vZ2YrX/VePDbiHVstdTEiqDxcd2+jLuUe4tHm3r7BAAgUPS1rv4WwDtG3
	7jJG0Q17E3tITs16KWB03HKe+/JjTwSIrX7jc7yhABhfQFUKBmiUx7g=
X-Received: by 2002:a53:accd:0:10b0:649:4963:7bac with SMTP id
 956f58d0204a3-64970d1bb15mr394172d50.74.1769315271142; Sat, 24 Jan 2026
 20:27:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn> <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
In-Reply-To: <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 25 Jan 2026 12:27:40 +0800
X-Gm-Features: AZwV_QiR-YxKTspwzVtAqnNU1yb2sCmX1Ygq3gSdAIf2_u_Qcvk5gX4z8V4nW9w
Message-ID: <CAH1PCMbEcVa6mAvw9UAG2T2Jy0W-+nEcw79nTHDJr9xgEdm0VA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 12:18=E2=80=AFPM Guodong Xu <guodong@riscstar.com> =
wrote:
>
> On Sat, Jan 24, 2026 at 2:25=E2=80=AFPM Vivian Wang <wangruikang@iscas.ac=
.cn> wrote:
> >
> >
> > On 1/24/26 08:20, Guodong Xu wrote:
> > > [...]
> > >
> > > Note: Patch 3 introduces a bisect breakage by transitioning to
> > > pin-specific supply names. Probe failures will occur on existing boar=
ds
> > > until Patch 4 updates the corresponding DTS file.
> >
> > Ouch, that's not a bisect breakage, that's an *ABI breakage*. And AFAIC=
T
> > this is still not okay in 2026,
> > see Documentation/devicetree/bindings/ABI.rst
> >
> > So the bindings would need to be changed to accept both the new and old=
 way.
>
> Ideally yes. However, considering this ABI change's actual effect, the tw=
o
> K1 boards (BPI-F3 and Jupiter) in the kernel get their power settings
> from boot firmware as well, and the types of peripherals enabled in the .=
dts
> files are very limited, the probe failure of the pmic regulator doesn't
> affect much. So, I think this breakage is acceptable.
>
> >
> > Driver-wise, at a cursory look from someone not familiar with the
> > regulator stuff, maybe we can make it compatible with old DTS by adding
> > the new names as aliases ({devm_,}regulator_register_supply_alias?) as
> > "vin" or "buck5", if we see the old vin-supply definitions?
> >
>
> We can do that of course. My hesitation is, however, it makes the driver =
take
> extra code which may not be needed once all .dts files have been updated.=
 The
> driver code will be left there forever.
>

Mark gave his opinion in v1 review [1], please allow me to partially quote
here: "(it's an ABI change so shouldn't really happen, but perhaps there ar=
e
few enough users for everyone to coordinate and it's what you all prefer)."

I do expect to collect more ideas before I decide whether and what to do in
v3, or maybe v3 is not required.

Link: https://lore.kernel.org/all/2e2c2754-fd3e-4fd3-aae4-d7af63e3b528@sire=
na.org.uk/
[1]

> BR,
> Guodong Xu
