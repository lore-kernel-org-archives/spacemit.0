Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF63E2765
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 21:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781039196; cv=none; b=B8h4eUjqPwyEqki95np7YafXIihQ36eRrVlZVoS5Eai+DphOiOJyskQfmzaTmgQbjVgyQTmW2vVLfP6/eY6dgGVQWJnQs2Yg+B4RWwXvrKlWJwhqn5JlR7VIQseIG3u0BShGo42AwJtS7PkQpHJleuMWDA0Twkvz04QIYqYmAHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781039196; c=relaxed/simple;
	bh=JnRgX0E23Ha/jYZIEprqGGXXF9FSZBw76QfDOqcYCMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNhK2LBX10VtW1yvnmMEWn/vU98i1IuCYwknrpnplqfAjXbveJoOtRYfpuYE4OsHpSY510w3nmENoUs9d6KDDg54b4rNH57lOo+dVRj5E8wYqjxTbcradvns2JeirInVQ3/Ov5reoMkBIUz+1a4G3uWHeojV8mwbTlfVSl6dgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCuP8G8k; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCuP8G8k"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso5321710a91.1
        for <spacemit@lists.linux.dev>; Tue, 09 Jun 2026 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781039193; x=1781643993; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dX9Gf5auhZd7M2vITh4vuMczhC2UZxTRI4fFpUYnQg=;
        b=XCuP8G8krP4XEEjuij/Ob891KCJrYvKM5MftsTIoUAzGNnzAjU+E7pEeJyJk6ZmVud
         RarSd5WfiaVpimOQvPhZVZyR4LKzrf9bE60LPPQHFxVdDH9LD56U/rJx45RmYhfef05g
         YL+5wF8yXzu6BRXMMFVE3Zk8UygZ1WCJm+wx+rRkWqTJjoL5Lnq4hG7ZKaPXV79TQgk+
         FtgEESUvfzhlX39aMt2gy2opiaavePUOudvi/kL6lvvhA79VniAIbWVhelG9Wyn4YwMR
         KvnDpXF42K2ndpX0WAgjcJHaE0DS42THm4UX6o5hzh/+zFR/JfZagvUqHT7q5IeLnKYF
         Az1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781039193; x=1781643993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dX9Gf5auhZd7M2vITh4vuMczhC2UZxTRI4fFpUYnQg=;
        b=jflhLrUukP1FSoc8My46AbKjuYqiElOIUAkeWCW1vnvZheLikK+ktjM2kP5NjKpaIO
         39PxqmtgTtml5W4yRnhaNaYpYBRT9izUNV+mJaDr7u97eoEngr1TlblGpENvJhV4t83p
         IDCcMbUaWHXWzHJ6NiNBPOJwFXempSTqeX5JEGXwvRpsrYOoUV8dXpZQ7F7k0qmDhekz
         4Ys+VuJ4FHKv8SUBDtWqGdflAdhrphtvKEnhfSgvR87NSb03+KVWCZb4qyuBcPI1iAFn
         wUXfjcGrLWZ2h8ZiwvJNi1JLBpcbEYjnwhVX07MGG339lPwTy8X7MjBpEDRX3AKAipux
         pOfA==
X-Forwarded-Encrypted: i=1; AFNElJ/3CC6jO9uNzScT23LWaR8yT+MNnp5y1oHIZgKgWfNZT21JCFT9Qs+Y/0XStbr+BNPljtikZZYoAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGAX2VRZdA93hdLMuBnopVA4K/N+outSxXW0a/ViWumUHIDYKD
	mdyDigZRXvoBcUz14SnsJP2N8iw7DHel6YWdhCWWnyV5ZvHTaNyicrTt
X-Gm-Gg: Acq92OG1N/ru/aSvIOPJRWIQYoNCvCUvy4H1FlBikctuwwu5sviD2R86o7+AOy2Zse1
	QLXt1LGuZi3gfrQ8tKO0KCXoq+WxB/Ov4icylt0cBmBaDl8c5l/CTAyNAqxh7AZtoJKYPZpzP94
	0dHbi8iOVQGmUpmpm0e0Lc3HMj6UHhHHQPkjBfnRJeHyZckeBtNfEmaX/gCoTpxhqGwo3vvKm8b
	K+CgMqKsuqNLSM7dX46NekEJaA09OSXGwdCbhD2WBNf3DD7oi+bYfT7j9TP82TRyWGNgbDZZ27w
	QUvHEDnaYE0Bp8LsFV7Vhi/GutwSvzErHm36yc4y3o7+p0DD3xPpBnY2KGMkaaRKgxOzGcRVaFO
	emoehIP3frl4S4+6eev9LLISFEOtnlC7jZdEGro1yLJ0mukBgP4dlFNjzr7fAwhuW07GwuI1Cqn
	3C325+6g==
X-Received: by 2002:a17:90b:5345:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-370ebff342fmr22737341a91.0.1781039192824;
        Tue, 09 Jun 2026 14:06:32 -0700 (PDT)
Received: from localhost ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm20158546a91.2.2026.06.09.14.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:06:32 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:06:24 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA request
 numbers
Message-ID: <6ycdvhpgygnelzp3ot63xtzcnlvac7emngvj7tviiclst4a7km@kjq7oqvecnxx>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
 <20260607-b4-k1-pdma-req-macros-v1-1-5b2a3955007c@gmail.com>
 <20260608-dazzling-hacksaw-dbe84766ec76@spud>
 <qxcpvj3eseclgonwuwx2szn2tj4uxci27mvpqwotj6uaiyj65p@7sx5tyzbfs2g>
 <20260609-freeload-luckiness-7a143eae62f4@spud>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260609-freeload-luckiness-7a143eae62f4@spud>

On 2026-06-09 20:54, Conor Dooley wrote:
>On Tue, Jun 09, 2026 at 02:55:59PM -0400, Guodong Xu wrote:
>> Hi, Conor
>>
>> On 2026-06-08 18:33, Conor Dooley wrote:
>> > On Sun, Jun 07, 2026 at 01:41:30PM -0400, Guodong Xu wrote:
>> > > Add a dt-bindings header that gives symbolic names to the SpacemiT K1
>> > > PDMA request lines of the non-secure peripherals. Device trees can use
>> > > these K1_PDMA_* macros instead of magic numbers.
>> > >
>> > > Point the spacemit,k1-pdma binding's #dma-cells description at the new
>> > > header.
>> > >
>> > > Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>> > > ---
>> > >  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
>> > >  include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++++++++++++
>> > >  2 files changed, 59 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> > > index ec06235baf5ca..0d4ac9849e27b 100644
>> > > --- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> > > +++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> > > @@ -35,7 +35,9 @@ properties:
>> > >    '#dma-cells':
>> > >      const: 1
>> > >      description:
>> > > -      The DMA request number for the peripheral device.
>> > > +      The single cell is the DMA request number for the peripheral device.
>> > > +      See <dt-bindings/dma/spacemit,k1-pdma.h> for the list of valid request
>> > > +      numbers.
>> > >
>> > >  required:
>> > >    - compatible
>> > > diff --git a/include/dt-bindings/dma/spacemit,k1-pdma.h b/include/dt-bindings/dma/spacemit,k1-pdma.h
>> >
>> > Why does this need to be in a binding when there is no use of this in
>> > the driver? May as well be a header, particularly if these are numbers
>>
>> Thanks for the review. You are correct that these are not referenced in the
>> driver. My change to k1-pdma.yaml should be dropped.
>>
>> > with a set meaning that are lifted from the TRM, rather than made up
>> > numbers to make a driver work. The former seems likely, given you're
>> > indexing from 3 not 0.
>>
>> Yes, it is defined in the K1 manual [1], see 9.4.3 DMA Connectivity &
>> Assignments
>>
>> Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]
>>
>> I will fix that in v2.
>
>Just in case I wasn't clear (and I think I wasn't), when I said "may as
>well be a header" I meant a header in arch/riscv/boot/dts/spacemit.

Oh, got it. Makes sense. I will move it to
arch/riscv/boot/dts/spacemit/k1-pdma.h

Note that I already sent v2 before reading this, please disregard v2.

I will send v3.

BR,
Guodong
