Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336D51E8329
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103026; cv=none; b=A9NmN3Ri66MwxyaMRum5s73l2zamTaCnPUegiJc7J4gK4rd+B89AR5/S6T4GVRtzd+yJ+XyH3eUxddldWPQDaKwKDc+FsQOvQlJKdPcX9ykfi9yryFD7bsQyFSmdJvAC8tJLVVkM99tT28Cg+05e2tCvY2NwsCBH/PHE9Lto95A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103026; c=relaxed/simple;
	bh=0xRAbK+n5H+csItC6n3OEL70ZNfh2mdODm1iNTdA9b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE+SKbY8HKyXImXLZ8qkR9NGeCjeapVpAdn0ii0JVgLX5z4/Wf8VJAcfMeTlqZmyGoHmSJBtRINONVFb5Nxx9jzqOBtJ7UtbWCP5R9P3TtbOLkzAls5oJ4snOs2HtUPf3/20y7Qd1pmZdQVxRqEEPxuxdc8nU6jBXPorugKrlJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im7Neipy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im7Neipy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0834769f0so98203865ad.2
        for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 05:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767103024; x=1767707824; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=APWv0N7VAVEafE/tRaAfzsntSA7mb1asugldnCJpAhE=;
        b=Im7NeipyltfgpqpCdWebK+BVkPXUUPNosaSYbVXU/Wu7PCex79Xgn0ACAbYDHC9k5f
         ByvDKTT8ittpx2II/XTR8Iv9InuCeeitXWVGLZw6JrTCzJwRRvGizm8CA0pAuJ+ufyUu
         yHDz3Ou5/pxu8doi2KqHC5SV4ZCAW7SOBgs+fwvZB9YdkfIJ8MMhFUtRpry1T1TQuY1E
         dvWEEXzKyXfg493wGHyZ6WC9dnXcMIkattrmg/P1WSbOZqnexcsbT3B3PeFSKkDjvPkb
         0GqCsadXw6ea7RLe7nOB9lkgxBt0zd/ywRbctkmmEiTmL3mPmwB1e4IyfDZgfKradBQJ
         qBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767103024; x=1767707824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APWv0N7VAVEafE/tRaAfzsntSA7mb1asugldnCJpAhE=;
        b=CrxKGLH3sP7RtqhOoL2p8tvgGvN44lUBHZ/6hEQtObpQ15py8oZOlvTpyqeLyPsW0V
         mQ7oEMvBBgnyA8INs/94uSbn2+sLmDtohQdTwV5B3UJK3qgo1WWSbBp4xEVVMlNyqGf+
         56YIKfumrQ+McPHUg/tlrTmFpzVlHbQD38zo8vjC02kEq/0p2mRclkewXpBZRf7RuiXh
         qyV+Nsc/p+IBgR1xyVoQw5SE/YjimU3d658Z/t8vbCKAIINcp4Alf2ld7CBuYJXMFrI/
         Twwhdp0Q7eL9y4psgfMk4TkebXkAkF2ddzR6TSIkjtA/RWCJFhvvobcac/3KdtKq7zVc
         Aa1g==
X-Forwarded-Encrypted: i=1; AJvYcCUgXImrEmCVpq9x9nhR0OFM2Qw6JPp0JTqfsUsNh0/y/ZKWfqElu5LO75XJyn0qVckP+rVEDp3v4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQCxAn9ldpkBN4i3dt/HSsfXw1L/EVzGajJb3spgcY47zcKbqv
	qGBhDDPuktCSyeOa/435lgN69UBXYlAmABsTE7bfPoGyUWD4K6/3wxGE
X-Gm-Gg: AY/fxX4t8xcsPDEbG9o47gJ6m1lBLFuIBK/qbNc8S5sWjOrvSkgRJgSYEVEl6M9a+LA
	ZBXbfYhyirbWoW/CGUkBCGUzafw21vxNM3SHLd2lgerAefckUmE+r83jGndfGuQS2WpBnIVZFun
	FeFnyFP5bn9XklY0H651iod0wYPh4+j6Ry4PraTpOTuhDHdsNK+AxEL1gk/24u/E0ai6mDJt7Uc
	rviFy2lfWhIFErceFHRPWvECbTwGDngiTYFD1OKk+yx/qM72ZVEdB52QUIQH7KoHZJoCA5RwIJM
	1yABpB0xGqGBmnGEgF/W658gkhhZAHhCP3jnqfHzk0Ekw2uKMLLr2/EknGMjynwjFmDNae1OB4U
	y8U/TorX1QhB7Hn3MR2ibONPHhQ8ej8qLDmxYw7FR8gPUpuW1W4cMjC7nbrHTdycevQ0DubVb0C
	PsX8Xm
X-Google-Smtp-Source: AGHT+IHGfTQHu2drfAKQu53WiG/Gy4iDJrxBQ4VfdVs/FW7w4jXnrnuNi5IJgVAmYtjoOeiIgiSPkg==
X-Received: by 2002:a17:902:e808:b0:29e:facd:7bf4 with SMTP id d9443c01a7336-2a2f2940511mr319051025ad.50.1767103023863;
        Tue, 30 Dec 2025 05:57:03 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d407sm299696265ad.72.2025.12.30.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 05:57:03 -0800 (PST)
Date: Tue, 30 Dec 2025 21:56:58 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i2c: spacemit: add reset support
Message-ID: <20251230135658.GA9515@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <604e5781-5c59-422f-9c5a-ee4be6f8b329@kernel.org>
 <CAH1PCMag00z2Fp8zjMUPS7AdU6Lgk0UsS+mku93NtNejqjyBMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1PCMag00z2Fp8zjMUPS7AdU6Lgk0UsS+mku93NtNejqjyBMg@mail.gmail.com>

On Sun, Dec 28, 2025 at 07:53:52AM +0800, Guodong Xu wrote:
> On Fri, Dec 19, 2025 at 4:03 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 19/12/2025 08:42, Encrow Thorne wrote:
> > > Add reset support for the K1 I2C driver. A reset ensures that the
> > > controller starts in a clean and known state.
> > >
> > > Reset ensures that the I2C hardware is in a clean state. We cannot assume
> > > that no program used I2C before the kernel booted.
> > >
> > > Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Replace reset property in dt-bindings.
> >
> > Replace with what? I don't see anything else there - you still have
> > reset property.
> 
> It looks like a phrasing issue. By 'replace,' I guess, Encrow meant that
> the resets property was moved (reordered, put into a different 'place')
> within the file, not that it was swapped for a different property.
> 
> Encow,
> 
> Would you please correct your changelog description
> in the next version with something like
> 'Reorder the placement of the resets property in the dt-binding file.'
> 
> BR,
> Guodong
> 
 Thank you for your suggestion, Guodong. I will modify it in the next version.

 			- Encrow
> >
> >
> > Best regards,
> > Krzysztof
