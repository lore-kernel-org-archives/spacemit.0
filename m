Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6861B35D5E7
	for <spacemit@lists.linux.dev>; Thu,  5 Feb 2026 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770277333; cv=pass; b=A8tH2n4Q68iW9NLQb2OTl0aKbALfYsJ846+uheelgpZ3Fgufn7ciEFM25Q1j7KEHuA89/SUBluATPSlSaE4IX4lV98ffptbBK9gzaPNzk35oZznnUW0RhIXA7wU8khMDijtWYJ8Hd3Xg+SFSTgWXhuOC5ulRvG6rfllreq1INT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770277333; c=relaxed/simple;
	bh=S/nsTC1/V0Udh3YCNfcgu7V9ClpdOHlVkJ1LUE3M760=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZcY/pW26O0dyuMGbcCTBCWWT5ZEOh7GPzKdSBj4kkPBw44EisgcfMymM2nc+PqxxXFn2dJC5AcGD+lA/PjiOSxV7GI7vnooFieVaULa1+wvpxndrQyJeSMNA56JryNs+B9nNJWS6k03g3Ru3aS4wkMGL/WgWWAQdP45h7EIckNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mME6BOTu; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mME6BOTu"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79273a294edso5672377b3.3
        for <spacemit@lists.linux.dev>; Wed, 04 Feb 2026 23:42:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770277332; cv=none;
        d=google.com; s=arc-20240605;
        b=QElI47qMcfFbi8ZOyDaYnNDOQ1+LwnQvtq9oqgFGY2xXgTsCu7MYUA6KCRqY8f/FCj
         AOpMUF2DLNkrQD5tLkZhEpFbUjzGM3jSyTrNtZGFLFmIFGXfWHpDVR+XeBiK6TJySeRj
         ysHw5FBCumBGdtQpFr8b7OGen+WBo1HSUc0sA8eQj3pozx2GmyzxzhmV3k6mg8TZk33A
         FaZO/1q+g2BRp2NWen/Y1aOuJLSvL3NLZQQDgzOFijwicudoWtu4f65zD8vX97gf5emM
         FIZe3VpmVG629iXME/Z9OrFRQdI9SCSW+ss48rM03EygMWSs3J/rvH/eY010nlWg8ds8
         N7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vCsVndFzrtL2hxIQjBbohAaFr2ETBAeGKs4H5l+MANM=;
        fh=V5McAf2c1iNmo/ZIhE56iZb4HFBGcsXUuyJkQTLNsa0=;
        b=h75URwTVr/DvGnUBqOG3DaHBnbE4fCnJJO63Ebvf1iGQu+tdk1yLnz1ZfIS6FIwzST
         qCUHAOClwYocZdUVQbbHh0SHr3vU6XqHLm4opeGad6BxKtlo/5RK56k0T5uDdiqdmPcz
         EEB/3ZxD/4vxDzwi/Q6GS9I1dNyFYhi8anql/BTm7AEUaRpyPjfEjTKoSJnNia4pHA+n
         E95l2c5Zs4iUX99mO2bXjY1DibkRP0nIxpE5Fa9ZOQA47GW7amW8Oz+FHwnT16PQuL4y
         kzjLEA57urll1U/+/QWQLi7+Yj6QApH1pja3Ppldif+YkYxfhxMusw4kG/LI95+xdNYk
         ndZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770277332; x=1770882132; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCsVndFzrtL2hxIQjBbohAaFr2ETBAeGKs4H5l+MANM=;
        b=mME6BOTuW94qDVuE3bxOvB6erhaeebGB0FtKCRSXbZMyPXISKhe4gt5UPC8Sn//nSb
         JdQNnWN/cxIlvl9TRBhlXvWI1oV9p0uRz/2aQuzuWeQEVDZK9OiMKi3bWb2yWRmqskp+
         q4iGA1U5TaaXLJn+3SqscKDYU2/8ppZfO50UWxdKltHECdZzZfKL1/rexSmN7NX9TLRd
         Xony88scoZv/7WWl+tqiGGB90Hn9aqlzECMr386KTMeFpYiVf2EXGeIGaz37a5UZ8gxZ
         1yNZtJeRHIZyXQhQpjt15yhnq3vjEdqG3gi+ocvsv8NTzw3Pk0a/WgLSmUlFcbneomVO
         X0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770277332; x=1770882132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vCsVndFzrtL2hxIQjBbohAaFr2ETBAeGKs4H5l+MANM=;
        b=VjO/PEOQunO+CyYcSnXxHH/kkcxceXdx3dY6TPOW0K5vLa2s6Rc1cXJGnefC8++O3m
         jph6YUssocWx3Cim66msOVfukPoNKDJnx4iygL8atH5B88robeoxq5jm1L+wv4h1aimP
         ZOA5KOOeVVLrhX9uTsC0P9Qc4iwa9kJ066En+AOveEQcG+kDGvZFHcrDKKO32KLJ0vOr
         eOsrcY7bmplSAvknD1sMRK9m8tf8BiQlXrxfX0VLSuM/f/fCobwvvp/k2ayqk6glYrnx
         CjPFbmYO68QAlFNbfsaNdVlCaz6lfVYrTPyLhLaczVBBQRAAeaaJq0V9BVABGDpkaDwJ
         DNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGc60eSbOUpioLRaeF4k4qEzzDuGJR8LfvgdgvJEBLPGm73q77amk6USF/0cd7cwuy5RSwG8SNKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSW6k4PmviT96x+zpgBUr6/7zAezefoFtiz8sffEZhqucowIZa
	U9RocjSXiE9YNLvfCSsjjX2FtwgAQS2ogGVf9b3xF3ILWIzwIgYvuaLRsVdqGgOd/CCoRxkzqDe
	aQoHhlh1S+0ctVVJgzjf7hYUej8P5VrA961BXSLX8zg==
X-Gm-Gg: AZuq6aLy/MAor0BkqqQmaIyU0GpavVLnulZT5HYwyNrTwgWrpYnzdGYHUBa7QzyIgOc
	oBjLAwCNPSFyuxM5nvu/WAzOUpaM6CbNKK0RtKmm2RN1IPLhTeYAZKKJAw5s9Q7JfDSf5Ai7rNa
	PWh6414H5vqPE66KzUo1mmSd5pxVpbgz4W0kogPzlFd7NkGx07itnDxuilLShyCPkILGQg3UJJj
	AxQLQ1Dg4VReEx+BJnxAULZMNH4FvCJa/FesLbcAfAqnmlzC1OqpFEHO8RP7dFBNoGRt8et1pr2
	DGLUV7e9IAHba5MEqhu+9oVsXX+GP7HcvyDcyP7mibX1
X-Received: by 2002:a05:690c:39b:b0:794:fe8f:ad8b with SMTP id
 00721157ae682-794fe8fae16mr55216627b3.29.1770277332375; Wed, 04 Feb 2026
 23:42:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
 <20260204-spacemit-p1-v3-1-a894b3057026@riscstar.com> <20260204-unlucky-raven-1ca0ed8f3392@spud>
In-Reply-To: <20260204-unlucky-raven-1ca0ed8f3392@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 5 Feb 2026 15:42:01 +0800
X-Gm-Features: AZwV_QheG0gYs892iDNFuUkxDWoz1fptgEI2peyofeZxhFHIoYa7PK0YeWnUmlw
Message-ID: <CAH1PCMZ9S95JHzuZc1hG0hwxjVmCg9RezZ6rNjt_xQ25FokQOQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
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

On Thu, Feb 5, 2026 at 2:07=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Feb 04, 2026 at 09:23:01PM +0800, Guodong Xu wrote:
> > Add supply properties that match the P1 PMIC's actual hardware topology
> > where each buck converter has its own VIN pin and LDO groups share
> > common input pins. Supply names are defined according to the pinout
> > names in the P1 datasheet.
> >
> > The existing "vin-supply" is marked as deprecated to avoid warnings
> > as dts and dt-bindings go via different trees.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v3: Mark vin-supply as deprecated.
> > v2: Remove providers from the dts example.
> >     Pass the 'make dt_binding_check' test.
> > ---
> >  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 53 ++++++++++++++=
+++++++-
> >  1 file changed, 52 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/D=
ocumentation/devicetree/bindings/mfd/spacemit,p1.yaml
> > index c6593ac6ef6a..41f784408e29 100644
> > --- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> > @@ -28,7 +28,46 @@ properties:
> >      maxItems: 1
> >
> >    vin-supply:
> > -    description: Input supply phandle.
> > +    deprecated: true
> > +    description:
> > +      Main power input (deprecated). Use individual vin1-6, aldoin,
> > +      dldoin1, and dldoin2 supply properties instead.
>
> What's the point documenting the deprecated version if it doesn't work
> anymore?

Keeping "vin-supply" in the binding with "deprecated: true" avoids a cross-=
tree
warning. Since dts and dt-bindings go via different trees, the new binding =
+
old dts triggers:

pmic@41 (spacemit,p1): Unevaluated properties are not allowed
('vin-supply' was unexpected)

Rob flagged this in [1] as 'intermittent warnings'.

I'm open to dropping the deprecated markup, maybe just accepting the
transient warning is fine?

Link: https://lore.kernel.org/all/20260129181604.GA1398997-robh@kernel.org/=
 [1]

Best regards,
Guodong Xu
