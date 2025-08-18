Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640A31CA62
	for <spacemit@lists.linux.dev>; Mon, 18 Aug 2025 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520138; cv=none; b=Bc5BihR3DWZDRtp4/tAS8NsN5ndpxJeBRZ1f+TaIrQTK3SwqYQzWIbeJvJ+UeLAgZaaL5Po6AEREbfQ+BaLlrL9wdjaFfvYJsRknZLKV3Q9m9V7UttNF2bnC9eZmHDqD0+VNDNprUDiTlWdBhGpqYcH7U360vGfNMqQswxhK8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520138; c=relaxed/simple;
	bh=NQlTT8wrBf6/5TXR7NEJIm2qofkpWCiqbqPMT/ijYsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7CvOWiuGHenH7JGs/rSazyZ4CUgnr0DQspRhUaxL2OzKAROiIk6WVBHTTGrksJvGGfd5oFzwohbxdiTSnyGf9GZwmZMj1HJw9UI/nY0L+EXQxfv/joguO/QjW7Kr+3pxhE+hw2Om2hdFPn3SQCWRBvhS5keFv8i6mnHGNWvUXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pQQX8ln8; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pQQX8ln8"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e94cfaa274fso743632276.0
        for <spacemit@lists.linux.dev>; Mon, 18 Aug 2025 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755520136; x=1756124936; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQlTT8wrBf6/5TXR7NEJIm2qofkpWCiqbqPMT/ijYsM=;
        b=pQQX8ln81Ui9cu73g7W36u/+npw6N3LaB9+BBosgSMi6JuhS1reZ5IfbkkjaAGLhw/
         DP3CiNDPLKWgMSsWhIEEdobrPp30Bq0hfHhnjOtaT7VfEy+dAdiI5G5Sl7XQJXRL8UgI
         wIRseQO8baU4C6dMbGXtDiMNt7O+9CYP5U3B8p2P8R522YUvZQlgdUIcNdJRvIyfQtJv
         Ih97PLvYUsXPUWUqQnyDzN3hotax9I5OlKZIBpzPHDEmqqd6Cu7eGSdQI/u71YTHThev
         4rBgSJm556Eb+5oPlRb+jOhv4ZeT0VgZHOnuFXMg9O0nYuDcAsvbDcvmHdRhwWUTn3fj
         j79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755520136; x=1756124936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQlTT8wrBf6/5TXR7NEJIm2qofkpWCiqbqPMT/ijYsM=;
        b=DRxrCrnna6GCiHw+8lpm6XS4bth4mouMMSNZLNhbknD8OOXJGPxRTfz2Yv3fozIba2
         UB08OMX42H9YZ8ZQga+EOQ6YfkaYbE23DBkL8dWa8hhvhB//dtoL0NFtF+egAGe+BKT4
         oL1Ns59AtIvyP2lVSk/VKE56TxMu68iMDpw+xPm1GXEmY42Rec2bPVj6kUZzoF3KNbgB
         L8ucZJxxA9P38u+It05wx+/c1gY8cwgwIF2Ag+zRB4VN8y+d6h3DFIjXRdJVdfx/DURb
         2zNCP7Thkeom3cP9tvhajR3gHi2gYdNeLGN5Sa/bedHmk5GN5sdn3wZSB7PvwXcGEHuf
         0dNw==
X-Forwarded-Encrypted: i=1; AJvYcCX+3HbZs8kq1XebLjOarOU/eiGTjefo/SXgVEEeDyYB1ubtCKnL7ZXDzUtgkQ11/5ZREcAkgVVfKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiawuuHfmzhjnTmazWzTxn3IX856UndSPH1tqTP6nqDpuyD1pA
	qEKbO5QCMiniGoL9RRw+8tSxo5wLwYyZZ43wVvKv+g3oyc9aarluaAVIDl7jcR5HMrqq4g2VhR6
	RHt20vBPYChZ1JxVSJhAzZxysj7PhBAok6qNMjsk6cQ==
X-Gm-Gg: ASbGncthBtmUQ/qaYSQujr+lks4MEVIscBN2xWoQ50/P/8anPdWTbEV+uHbUUtX3LZc
	aeU42a8Kn5/n+pv9p14WSgaI8rP7r3cuPrymjfRcmwGOmw5om0UpiX5/oPLVK7hrMW27dQFoPFn
	5nSdNS/2WvHwbSPyZ6rdhBEf+t1aS9DCFkNemn6MXII5vhwb6N+WioqcjsfZrH2q6v4VF1g2LPV
	jx/Nw==
X-Google-Smtp-Source: AGHT+IFx20xElPVqlagxACjExJ+Sc5Ef/knSr80J9ZkH6gy2bssr57qeuBMFLMu09POyk3VR+IV54ktaJ+qDsdY+z6Q=
X-Received: by 2002:a05:6902:72c:b0:e93:4496:a2b9 with SMTP id
 3f1490d57ef6-e934496a74bmr9054970276.13.1755520135996; Mon, 18 Aug 2025
 05:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
 <20250815-working_dma_0701_v2-v4-6-62145ab6ea30@riscstar.com> <34485B93B03EAD10+aJ7NVbe8aqjWBFd-@LT-Guozexi>
In-Reply-To: <34485B93B03EAD10+aJ7NVbe8aqjWBFd-@LT-Guozexi>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 18 Aug 2025 20:28:45 +0800
X-Gm-Features: Ac12FXzcLxiREAyDvYqUpnp8Sh2Su74nBhalceLEh9KttzUfLjprws3CtQrXJOY
Message-ID: <CAH1PCMahKsCsgmZixartnu6Tq8Oo28bMVNfoAWjnFA2McOOU3Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] riscv: dts: spacemit: Add PDMA node for K1 SoC
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 2:04=E2=80=AFPM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> Thanks.
>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>

Thanks Troy.
