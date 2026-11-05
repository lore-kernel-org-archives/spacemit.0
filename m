Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870777;
	b=uDSPWR0jwSNqxBQVriQJhs2RZpf1mOdlA/0ZnfFI+O1YG9XbXaJEBmCQOS4dsbEIBljo
	 FBpLvioa+FyOI9jaYyvt4EA4w/gvzxAx12HDkSuxZJC9pPKwwYwQaqFItegg2AB+DCf21
	 98lthD87apT237vO9Z9cIOzCP1WK2H/snhV/LZUn4ZYGCGBzUAi3exW3y3l++jkB/GTkl
	 SJrFIL489Wf/BS/Sic33bohWxxkngQ4mDk5+d6HaKJG7//p+6Sz6h91X+c5ezxia5WSr6
	 l6JJtA8qWH7T5Qa4rl4zPa3IwCmcDSiDMCom9mSp9ByKvFx1q0rek2g3N7faseJOIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870777;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5weTVNfU4RUIXGu4AdbAlzA0cfDEQJq11kojXW+pkrY=;
	b=Ne4Q8p5VBXlg+9fC2k+DUOHLEp33JW9zt1QauI4g8fvHfXfqOviuRGMi2IRpAO9K2TPs
	 76c5fiJmuzPZREd+y/TLSZXgcFY6P70scdyCD+3g9zSKPHqFMTOQ3gXN98xGNCY5b56Cd
	 TIINv19AaTpsbwLJrHhBkAOOi7rScDEmU7q4bWQtLsV8Jphsfg+ls2tXTh9BoLD8TNT9a
	 nDTMntgew+X9gcPifbvGRxIBvf6cu5kMNfjYWFfPRk0Jir6gHJ7K8CdMygcGc9Pbvt2mX
	 fK5YCKhQudAty+z3BWUd8d3jcigtMdFOxNgaWHVKldwmu5f6g9cJM/8hQuK6YbdfvDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbG3gRvn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7FF606A32D
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbG3gRvn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279E71F00A17
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870777;
	bh=5weTVNfU4RUIXGu4AdbAlzA0cfDEQJq11kojXW+pkrY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZbG3gRvnER6mcmNZ78al8p9Yy2sUU9nAr67z7Iu0pOZ0CbD6QzrYO0YAVZOxtEz6U
	 OBYxMo4sEj9zh33od6kOmsZvuLCSVgR7j2oIdAXZNw0JkJ1Y66Dxlnuho5lLA0wGns
	 ilLArm0Npn8kEe2gSbElNRJ6zx6U/KEW0orbBvOkXKjU5ru6yfZ36aYFrNCInS1uOw
	 sOgA4lAfSpDqGbD2F+YIS32RslRYwvYzaQjaYyqEK37TkcIwUh1jZRw6zKyln2zhvC
	 4QsYlRIiukxWDgmNxXpTfYbOnnqR+r7uK1pDgFAF9pAZjPLd/7ho2jD3SrFRqrYJav
	 CvKGREnllCpkA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bffd1e177fso279379e87.0
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 01:26:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwTJAomoyL23KqVrH3mK6cs0sLa5WqPbS+OV8FElW2dAYPeNrL4GNu8ctj1SUta7H4mYVARCdemIw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+HqHU7zdf02gy5KQTqNZ12od4dcYuh3+Sq1w8vBQdRpLel1UoA
	Al3ZzB2CQ1P7I3aI93CsNBAB5LIHdNfOQZ4/WhsS+vGeICGXW6yjBMYEBplfaUssvzqUSh26K57
	R5MBU02aSS1p6tJaGZvxTWwkh0PD2VEM=
X-Received: by 2002:a05:6512:3da6:b0:5bc:f29b:1a5c with SMTP id
 2adb3069b0e04-5bfd956517bmr6620245e87.23.1793870775961; Thu, 05 Nov 2026
 01:26:15 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAKNLDZOndyGxLSWgBDrq0Vfbt88Pa5S2MDHVcnkHzAH3TQDpaQ@mail.gmail.com>
In-Reply-To: <CAKNLDZOndyGxLSWgBDrq0Vfbt88Pa5S2MDHVcnkHzAH3TQDpaQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:26:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLkgFOGT54_W6gOnz+aWG4_q3XHc7Cr5_=8mcdv8-aTcXA@mail.gmail.com>
X-Gm-Features: AclHuK8CorVO8MUeqTFvv7Et7OujtWjRgY906_d19hm5pp_OhIMEqRRrkZlLLfw
Message-ID: <CAD++jLkgFOGT54_W6gOnz+aWG4_q3XHc7Cr5_=8mcdv8-aTcXA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] reset: add support the GPIO provider with #gpio-cells=3
To: Marc Taylor <marctaylor700@gmail.com>
Cc: bigunclemax@gmail.com, p.zabel@pengutronix.de, brgl@kernel.org, 
	krzk@kernel.org, andre.przywara@arm.com, martin.botka@somainline.org, 
	dlan@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:57=E2=80=AFAM Marc Taylor <marctaylor700@gmail.com=
> wrote:

> Sorry, my mail client mangled the inline diff in my previous reply
> (indentation stripped, and it turned "https://www.google.com/url?q=3Dhttp=
://spec.np&source=3Dgmail&ust=3D1793850929317000&sa=3DE" into a link). The
> attached reset-gpio-3cell-v7.2.15.patch is the correct version; it is
> re-attached here so this message stands on its own.

Don't send attachments, inline patches only.

Check:
https://docs.kernel.org/process/email-clients.html

Yours,
Linus Walleij
