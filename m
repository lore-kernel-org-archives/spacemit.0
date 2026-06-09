Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C974C040D
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031370; cv=none; b=Nixyl1Wtrg1ZwgK6rj58dzZ66+ALDhRPW4NT3diJelZVfz/M7rA9IKG0cEV+YHVPWxh95qOiaydL1NMi44VnL8t8WRxTmSVW3cshyYsElrtQU2iqk3jnNfdcQeggTEOTqO02YE/BPQ6D0+6tdZ8i81/0pujOVbnOZtFkeVRuoLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031370; c=relaxed/simple;
	bh=qv6NSO78UBvOvcAVkfVRgLKn0cSCdV/ghe8m+ViedI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nn0Gpoz1Z33JWlZZCk6JGCrJx7Llo6wl7i62Hx8a7qwY5WjZe1KlA1TSBGbgrcE5F07rhPUTVCZeF24bV6d5sxg0n4cmaFo3ovJNUJ04SMCTlPLzBPPg6PuDy1FKEIobuZiGDO6XaLdt4uIYUgdzUttzEjiBCT3F0JnawOzoVZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7xODj/O; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7xODj/O"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c2a68d01so40629775ad.1
        for <spacemit@lists.linux.dev>; Tue, 09 Jun 2026 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781031368; x=1781636168; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G32fw+YDIkyZWRzyQasWU1L7Th532AaegrDAEvejK28=;
        b=l7xODj/OvMxwGZFd39hSJ7eX/kA8rTlVzxTYE9/48p4j+Oji/rVqorcsjebrGN3oy/
         6b3gsaghKj2QX9RjpSAac+WCywNc7Ec8rB0cyK8D0ne4qDmpvBeNLk7Adepjztqb0+DI
         hx6Id+UGlDQfJ5oIMJheBJU2SfToDj7oh6OkTNePlelHqcOfRSbPIKir3qsdK0vKG7ss
         wGxbKs9YE01SYXNcJGVf+VOtS6U8gNNCaH/AHXxvsLr7MaDQ2XdbhZhcIRkQMguApBob
         ngT97bWk5rQgtgPoSVyQ31CO59Xk3H71GH5yY0s5pB1RMDXBmBkldwMi5q/PJMSHPUcZ
         hjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031368; x=1781636168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G32fw+YDIkyZWRzyQasWU1L7Th532AaegrDAEvejK28=;
        b=rRKacMRDJrw+9IMdQKZ2Pf9Yn97ElTnqI2mhgfKxjRYVRm/b8ZQklVAZ7sB3Gnv8My
         MAx1v1oJKrhgxynO41qwA6RJ40CQhQxEZahpr6kSZttY1uNPg01J61zNb56CKT8C7QLF
         Kdl+jFLtpdvlBlFGvhDzku4ASqKy7shV6nFGeqqbnndoBYKViFHSCYBG+WckNdr3B6x0
         Z5+g0m7Mkfu/vtgqiL6JANSt7svKbaWIisw7/6Qa3tuv6M6kRDvF9W0PBDYCaDUhZoIh
         0iPN5aY2CpuvFpD+oG/nS8KiMcIGMbuI2HER4Gr0or2ibdbzzqkAGrHgA69OEUilY0L7
         ZErA==
X-Forwarded-Encrypted: i=1; AFNElJ/9iEcr/gp3lYgZfMb/6Yz3Owu5ch3xfn6iWNcNuH+T3XTe/c79Z+p2C40HfSHDeLv/MyHvLJ19gQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCP5nXVtNBC+e5oQ/xp9yvMa53AAxp1vWkaZz8TF+x9RnNb4kT
	hkxBHXXiqzwvJwE6rpZtR84C5j9U9zSzKOk0J+4/04Yk/R4S1ZrzKq/H
X-Gm-Gg: Acq92OFYtzzQPwxN9hjekgZtlxEUSPWX4aNUuBP86NDQPAKE4EuB/voHFBpb2+m1O5c
	kTzTAPgQt39LW8JP92S5ZdBhgnfUk9YvV9pkrWaSTVDj+0g9bMUJe3yF6gOL5MSn50mSjQfKkPl
	1IZDZQhL1BvXFfnrAzFKpS+U1p1PO7fvysMiNBzThLshnEPMlnp+j8YMKyZberigpUJuAJT/Agx
	+RXeUtNOaWp+NW6Z4mS5K0y+pShMpz0KjUmSJozOYPgkGttGtnj1jXMCF8TDgMVggw4oRUleJRs
	abm9zUMNRqbGavwuDc2hgPiYIKwPCmaAm1Cdi++D110wHe+B0Mg4O8wVaH93QRLmrMr3TInsPhe
	1miclPJsotcqbFsC4HFeBPtLQLDnKFbwNWLtRmzw4yyMhomiff0jRxzWedKLrU4rLCsd0gfSAKq
	5cb15+0g==
X-Received: by 2002:a17:902:ced1:b0:2c0:fa4e:91f6 with SMTP id d9443c01a7336-2c1e7d41eabmr240045285ad.13.1781031368012;
        Tue, 09 Jun 2026 11:56:08 -0700 (PDT)
Received: from localhost ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm95637445ad.81.2026.06.09.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:56:07 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:55:59 -0400
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
Message-ID: <qxcpvj3eseclgonwuwx2szn2tj4uxci27mvpqwotj6uaiyj65p@7sx5tyzbfs2g>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
 <20260607-b4-k1-pdma-req-macros-v1-1-5b2a3955007c@gmail.com>
 <20260608-dazzling-hacksaw-dbe84766ec76@spud>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260608-dazzling-hacksaw-dbe84766ec76@spud>

Hi, Conor

On 2026-06-08 18:33, Conor Dooley wrote:
>On Sun, Jun 07, 2026 at 01:41:30PM -0400, Guodong Xu wrote:
>> Add a dt-bindings header that gives symbolic names to the SpacemiT K1
>> PDMA request lines of the non-secure peripherals. Device trees can use
>> these K1_PDMA_* macros instead of magic numbers.
>>
>> Point the spacemit,k1-pdma binding's #dma-cells description at the new
>> header.
>>
>> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>> ---
>>  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
>>  include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++++++++++++
>>  2 files changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> index ec06235baf5ca..0d4ac9849e27b 100644
>> --- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> +++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> @@ -35,7 +35,9 @@ properties:
>>    '#dma-cells':
>>      const: 1
>>      description:
>> -      The DMA request number for the peripheral device.
>> +      The single cell is the DMA request number for the peripheral device.
>> +      See <dt-bindings/dma/spacemit,k1-pdma.h> for the list of valid request
>> +      numbers.
>>
>>  required:
>>    - compatible
>> diff --git a/include/dt-bindings/dma/spacemit,k1-pdma.h b/include/dt-bindings/dma/spacemit,k1-pdma.h
>
>Why does this need to be in a binding when there is no use of this in
>the driver? May as well be a header, particularly if these are numbers

Thanks for the review. You are correct that these are not referenced in the
driver. My change to k1-pdma.yaml should be dropped.

>with a set meaning that are lifted from the TRM, rather than made up
>numbers to make a driver work. The former seems likely, given you're
>indexing from 3 not 0.

Yes, it is defined in the K1 manual [1], see 9.4.3 DMA Connectivity &
Assignments

Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]

I will fix that in v2.

BR,
Guodong

>
>> new file mode 100644
>> index 0000000000000..491976516550a
>> --- /dev/null
>> +++ b/include/dt-bindings/dma/spacemit,k1-pdma.h
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * This header provides DMA request number for non-secure peripherals of
>> + * SpacemiT K1 PDMA.
>> + *
>> + * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
>> +#define _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
>> +
>> +#define K1_PDMA_UART0_TX	3
>> +#define K1_PDMA_UART0_RX	4
>> +#define K1_PDMA_UART2_TX	5
>> +#define K1_PDMA_UART2_RX	6
>> +#define K1_PDMA_UART3_TX	7
>> +#define K1_PDMA_UART3_RX	8
>> +#define K1_PDMA_UART4_TX	9
>> +#define K1_PDMA_UART4_RX	10
>> +#define K1_PDMA_I2C0_TX		11
>> +#define K1_PDMA_I2C0_RX		12
>> +#define K1_PDMA_I2C1_TX		13
>> +#define K1_PDMA_I2C1_RX		14
>> +#define K1_PDMA_I2C2_TX		15
>> +#define K1_PDMA_I2C2_RX		16
>> +#define K1_PDMA_I2C4_TX		17
>> +#define K1_PDMA_I2C4_RX		18
>> +#define K1_PDMA_SPI3_TX		19
>> +#define K1_PDMA_SPI3_RX		20
>> +#define K1_PDMA_I2S0_TX		21
>> +#define K1_PDMA_I2S0_RX		22
>> +#define K1_PDMA_I2S1_TX		23
>> +#define K1_PDMA_I2S1_RX		24
>> +#define K1_PDMA_UART5_TX	25
>> +#define K1_PDMA_UART5_RX	26
>> +#define K1_PDMA_UART6_TX	27
>> +#define K1_PDMA_UART6_RX	28
>> +#define K1_PDMA_UART7_TX	29
>> +#define K1_PDMA_UART7_RX	30
>> +#define K1_PDMA_UART8_TX	31
>> +#define K1_PDMA_UART8_RX	32
>> +#define K1_PDMA_UART9_TX	33
>> +#define K1_PDMA_UART9_RX	34
>> +#define K1_PDMA_I2C5_TX		35
>> +#define K1_PDMA_I2C5_RX		36
>> +#define K1_PDMA_I2C6_TX		37
>> +#define K1_PDMA_I2C6_RX		38
>> +#define K1_PDMA_I2C7_TX		39
>> +#define K1_PDMA_I2C7_RX		40
>> +#define K1_PDMA_I2C8_TX		41
>> +#define K1_PDMA_I2C8_RX		42
>> +#define K1_PDMA_CAN0_RX		43
>> +#define K1_PDMA_QSPI_RX		44
>> +#define K1_PDMA_QSPI_TX		45
>> +
>> +#endif /* _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_ */
>>
>> --
>> 2.43.0
>>


