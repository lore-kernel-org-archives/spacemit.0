Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CCF2036E9
	for <spacemit@lists.linux.dev>; Sat, 31 Jan 2026 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769862360; cv=pass; b=KX1alxdjaLlJyhwTGHfQfthW0Lx9tXx1ER/StW5BZUZsf1PVTMjPwmfzRwOfoBuV9jitf6muGi/gD2czksGhcuPnNBsl31l5y8B8l0EVdfFAnCRwjbPjAbtgiaNUlTWw+lrfdtVrjNeahfMA1SZRj4JLjXYm2W4OS43uNKE2o2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769862360; c=relaxed/simple;
	bh=MiichsdSezlnnWGRAl5mtvZSoLSKQHQU9PbROyrd6Dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLU4VpJFsSVoIpEHr0Fc8O27yhF/sniDQE6S8W2I4A/67hoUxZxujKz5zM1B8bdgE7vffOFW8+zIinPvkYVssgU1RuCYdlfQ3M5NmYBJngkIK0/hkPJYoCKRjPopr/V2rsjxC9cq38sssurSvmDMTY97DLsZdZEiI7MjyL9XLxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Plb5QBqI; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Plb5QBqI"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-794719afcd4so31193307b3.1
        for <spacemit@lists.linux.dev>; Sat, 31 Jan 2026 04:25:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769862356; cv=none;
        d=google.com; s=arc-20240605;
        b=hMJrrFak80LZdjCYWXOQkP+YXqJYrZVo6TkAdJ3xuS4pujkylUYl196ZlV1vN6LvQW
         clPLOlvIi4G6l7p3J2ReK8ezJd0Ba4OvFXdnPaEG9hG56X3APTtOKf4gJP1rFVv61bTz
         AIb/Gk65xuBrTDd/6ETiToMvwTfqVzbs9hCybuxGJVIcSDGf+6R2C1sh039a9MPsTGn0
         BhhIXywTUCkIO/ICG1r+1Tpuf10XeLmdGMK3ZaxOydzf2gftIgHm1pGL7E/YDKbs8Hv4
         NM+xWi6zLG6XWJcTPdNLGiFDMac4jnzGxV8YOySLFOscP/se881GlzS/TqDlPt3nUnJD
         5BHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h7Cbjeq7Awq/O7OYp4EoKC8ia2Rbiud6u+LNrpADDGA=;
        fh=LpXHjoo1iwjtQ5mcgs2yV+Csq2IDE/F4j++3vF/f+Go=;
        b=D7+paIs8v+8O6e1nj5coAGfYTj+eGwX7NyocnGUX/RN3xy411T5CMWlK1p7UKNF+4P
         ieDCIFbKP1/Jkdv8k5e6+sw/eqbzTZyMxofuk2HiJtgUWA4HShfvOi2mdoNun3atqIUA
         YGZQ66my0riFyJaEOEi2XFhFbz1VLVoomLgsVQTimiZNgTfQZNgP7r2LvStpFMxsPID0
         F5eKH6OVMFy34dv77M65pL9qBIVMrHq3JdUYhSSwnM7SUmu17JJ6RDTYxABEJAPLsvel
         8+xmj6mz2kENBNUCbJ2n/AlnoEbzHE7ACamOvF9Nr2AoSuibLVIbniMajH+Qp5MDktbU
         JeMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769862356; x=1770467156; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7Cbjeq7Awq/O7OYp4EoKC8ia2Rbiud6u+LNrpADDGA=;
        b=Plb5QBqIeMNut79SFMGLE+Y4yZU2hzOjZQK8lGBBKyFi2H1/KePAKgA+hNZ/bvG6Js
         +dLLX+hy81uZLZdA3R1iw3UJqDJlczA2n01GhHHMmRPeSWIekWiCSpTbCQRfwvm/QlsZ
         a+D/F7DlF3dtMl8IojDcMddUMH6I04eR7F4rvE+q7ZQtTrswBw85y82PSopwbYwd699+
         6LN/EmaDUqk+zchifsiQQu4ewSCyhQev5j21lruuJP54SEYIrVisAWKQUUDsYlN5bGCe
         8JiujS+xIqvd4My321yX9hPpquUyY0a6UVKTEjswW4CVy7ZreflWxfGERy2wOYKJcma3
         vtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769862356; x=1770467156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7Cbjeq7Awq/O7OYp4EoKC8ia2Rbiud6u+LNrpADDGA=;
        b=V2YluILsMHVjf8TXenAOJ1UCKgCPgQp8XxWWBQfQlFACtf/8IltcBy5rceRlPmpDkp
         XV5asRTwMBMHNgq3jTNLuvFXSai3gYWSXlI9i47z/NwpsfPXEb6tMkeNbChk3uP9yGsC
         2pLnJHDHg09+NRu44pipbHqWLXxNABclq1Ju1LdYnnK8ppEKJLoCOjCmAaWjjkIUD8jb
         +wjTlGDN60BEgvMVHsQiu83FsW86rO5rqVW0bBs8YFMKIUd5oNpBjc4FgsZXozKfejVx
         YLUaeT5UWoERpUOIrKPb+zK4MZyq5nK3f0toowdoFDEyEYnYFuQzH9TOAt2CJBrReecv
         90Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUjfg0i5NZSLfLjAMd/d2S2do+7UIqDuA2T4xEnVAM2wxNmLVEfa8VFWglWx2CCu33Pinh28kuSaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YycNdDuiVZbErUCAjG3nbRjPnKQaqpufrek93QW97ujLIbIizqR
	sg50zWJ4lg6CenRsbI6IZRQGUqXIdwkpOw6s1wkNqK0y7qYJ7CVwm3e6RPJ3bKdV91c5qlNt6hl
	ObiIsAfhfQHCUojdGzIBefki9jrUALD7zyCsv38IS6A==
X-Gm-Gg: AZuq6aK1P6Zu7Ch3IusTCLTIAWcrP6VyhRyuaebQC9gGU0GPgeShJzG3OhLrfE97DLV
	MiQHQbxVI3zpPnstckhDMYOy2MgyE5lbkDpCWp1Z+qpFgVPrOZgEbBxuovBsbJ8l+RmQf6thd4Q
	ucktK33ZF02VlkPOy+eFk29AbROdbDhrksQWgxpXcecAqeAHA3xqcVhk9wu9IJUPPjS0p1L/sBy
	KO34UrqKm34TOVUSzKVmM8hV/Kd3Gq+MtKVDuDZNX6vT3605yqwkl9UCFTnihAPenZHZZm5EG3O
	zJfiGK1IQwSHcTu4JeJk8Qqaj2EZkdunl+anfb8/hOIo
X-Received: by 2002:a05:690c:6:b0:794:b829:a972 with SMTP id
 00721157ae682-794b829b51emr9689697b3.54.1769862356527; Sat, 31 Jan 2026
 04:25:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com> <20260129181604.GA1398997-robh@kernel.org>
In-Reply-To: <20260129181604.GA1398997-robh@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 31 Jan 2026 20:25:44 +0800
X-Gm-Features: AZwV_Qjm8BHNJs0GMJn5ivWOUQubalnC8bF3mZnT2zWfuDpse3TJU_08t2ThoRs
Message-ID: <CAH1PCMYmK=cenJAvhGdZuh68fwNu-c_JJFpyztZUXvcOTv0YSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Rob

On Fri, Jan 30, 2026 at 2:16=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sat, Jan 24, 2026 at 08:20:17AM +0800, Guodong Xu wrote:
> > Add supply properties that match the P1 PMIC's actual hardware topology
> > where each buck converter has its own VIN pin and LDO groups share
> > common input pins. Supply names are defined according to the pinout
> > names in the P1 datasheet.
> >
> > This allows different boards to describe their actual power tree
> > connections in devicetree rather than hardcoding supply relationships
> > in the driver.
>
> You are breaking both forward and backwards compatibility changing both
> the dts and the driver. If that is fine to do, then explicitly say so.

The breakage is acceptable, so far as discussed and agreed with Yixun Lan
and Vivian. I will update the commit message to state this explicitly in v3=
.

>
> A secondary issue is the binding and dts go via differ trees and we end
> up with intermittent warnings.

I will add "vin-supply" back to the binding with "deprecated: true" in v3.
This should solve the binding and dts warnings during the merge window.

Thank you for the review.

Best regards,
Guodong Xu



>
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2: Remove providers from the dts example.
> >     Pass the 'make dt_binding_check' test.
> > ---
> >  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 ++++++++++++++=
+++++++-
> >  1 file changed, 47 insertions(+), 2 deletions(-)
