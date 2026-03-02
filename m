Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496B836C9CA
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454190; cv=none; b=iwghQfYvu19HqH1e2e3olHGoRn1X30Zgr4UccsNUuNW0cXz9+cip7UcgeLfBFeCrBGNm3qxmcJ6IRpLFyLRPXletaFI4bG8UNZ1Ohss4HmegO8AcU+3a9S4FOKgBSBUqfuMPyz2UV5yxRGeCSSgboJzRN2ApCAYVX5O/u69+36U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454190; c=relaxed/simple;
	bh=AN1UX7ybnPRNMxbRnoTK3neHjvBhjhUKKMLCvp8O8kQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eSl2wTpw4xRXvB93p3ODS6nVEyP6gCwDPJmkmN7wbSJt1jKf4AfWu/7eXbEx3KhMVSAa2IVBjwmK9mnu0Z3MAzCyU0Qip8v38bX2MPiEaGlSoHe5jrL+UUAnxmCdfav1/jy5Yc57kLkg0kWY0LkcldNvaUQS4uzx9B9bdONnJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fymQkPgR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fymQkPgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772454188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrnLTibfvtaQomZCj8lbE4/9KS67i2w3nIX7Xx6+g0k=;
	b=fymQkPgRy5ZPwmyInwXGohjTd3JU7o+lUnV4gmDQIbikkugHzCPoC8r5PXPCHCIu1btkn/
	BZF57snNqACAnFe9kw1rJIidHHQpErZF6mS1B9LzmJXBMgndc3MZcNNdMnZBISI7pARLEV
	R9ibU/o8YRHA7rNh4E/Ljqwu7oDyDPo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-gKY0ltg2OgK_9sJPIk7eNA-1; Mon, 02 Mar 2026 07:23:05 -0500
X-MC-Unique: gKY0ltg2OgK_9sJPIk7eNA-1
X-Mimecast-MFC-AGG-ID: gKY0ltg2OgK_9sJPIk7eNA_1772454184
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4832c4621c2so48506755e9.3
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 04:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454184; x=1773058984;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrnLTibfvtaQomZCj8lbE4/9KS67i2w3nIX7Xx6+g0k=;
        b=b1HM+I3pUfQzcmJDd5lKGg8qs/RSuaOecUL6gXrCm1uADSvP+PKGI8yqvWsZGltS3g
         tw4+Nj+1HlSVVBBVzJrabc7LvK+fnpgAZzLKO7ahNtomyWdmI67ssjuVioIQ4hfBUTo9
         2TUPMtLp/xjGxkT6h7rI2rFLXc9YYwjczZzbUElJQ8KcQ6TPM7j+iFh4KvCw/1zYfNV2
         6q7+iUs8EELwNW4huUq4ZC1DjW4/lEHfLHXtdSMtVbyIGTQF0Q+WQBIt1nULnAbW0aIQ
         toQGfZcWdmOppOvBiktpobIKwF8Wcp7mRJRqDRYXBiQHbfJo1y/1sy3UcL3xNcc3RTf9
         SVhg==
X-Forwarded-Encrypted: i=1; AJvYcCV9W/WvdfE1X+XzS/DZrAgZKMXf0SRnknFd/Z4ftWEu7MHEur9HBPkuKS/lkyFTuk2+gkI3Pw8HiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxToszWkrsRyIuCEku0nITR+kajwPV3lltWUfzfr2MZuKF621Wq
	7lr8dNCfBfWyziyW47a0b0ro8k9PsBYntwK6ry789MTN8+oGMCqBWm4znm30sG/om2EV8sbnYHm
	qYnDdm4ggclm4iQSBUIZyz02qVMEP/AoNtiARRZcHGfkFCbw81vLnIngln6Q/
X-Gm-Gg: ATEYQzwn28wk6hoJWvKaUCgmBxgGzj04ARWJ6sr+UekHyXHVrZ8uhj8ScXfdQa0nrVW
	MwJNE9MvxOHm3NkrW8IDvrt+rV9rzy5ExDoluU3CrNdejL7I/gwLRc+zfkvqHOoygNmBf7Gscvo
	qx5F85sJFqQhBYyQWabdbogxOy+4UchmTZP6V9PnfGXyWBL8tRZvfLl2CBzZuhEMo/KpgjwHx3Q
	d8KCJFUYSxoTmlUMFMBpPOh9f6sBqqM6Q0hiKEA9MHxtyT6fy7OfRPBFZ0ji1BH/TXKJA+HVbRq
	wWleMD1B2TVVNU29+kM3Qm3Fyf563RIx/dCrhSa36ei6zySg3Rx4GyXg5vf+/ET33X0HCNsyFEP
	n6ztET6Ai130JzgKAac/5LFXgkhWpsQ6oh70EaK1m69l8dosna3gKUjY0k84+HauFq3kSnuhFzz
	ZYv1aa
X-Received: by 2002:a05:600c:6994:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-483c9c0b88amr205633575e9.22.1772454183812;
        Mon, 02 Mar 2026 04:23:03 -0800 (PST)
X-Received: by 2002:a05:600c:6994:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-483c9c0b88amr205633105e9.22.1772454183415;
        Mon, 02 Mar 2026 04:23:03 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcd0b14sm129147135e9.27.2026.03.02.04.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:23:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: adapt regulator node name to
 preferred form
In-Reply-To: <20260302114257-GKA289813@kernel.org>
References: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
 <87o6l6vd7l.fsf@ocarina.mail-host-address-is-not-set>
 <20260302114257-GKA289813@kernel.org>
Date: Mon, 02 Mar 2026 13:23:01 +0100
Message-ID: <87ikbev2sa.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VoFHU02S4a2hSi8QCXRTtjg8eXmW_qHaJ-P2qHDXtS8_1772454184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@kernel.org> writes:

> Hi Javier,
>
> On 09:37 Mon 02 Mar     , Javier Martinez Canillas wrote:
>> Yixun Lan <dlan@kernel.org> writes:
>> 
>> > The preferred node name for fixed-regulators has changed to pattern [1]:
>> >  '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
>> >
>> > Adjust all SpacemiT DT regulator node names to fix this.
>> >
>> > Link: https://lore.kernel.org/r/20240426215147.3138211-1-robh@kernel.org [1]
>> > Signed-off-by: Yixun Lan <dlan@kernel.org>
>> > ---
>> > In Review of adding DTS for OrangePi, Chukun mentioned fixed-regulator
>> > has preferred node names [1], so let's change it now.
>> >
>> > This isn't strictly a bug, so I've not added the Fixes tag.
>> >
>> > Link: https://lore.kernel.org/r/20260123145015.1926865-1-amadeus@jmu.edu.cn [1]
>> > ---
>> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 10 +++++-----
>> >  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  4 ++--
>> >  2 files changed, 7 insertions(+), 7 deletions(-)
>> >
>> 
>> Looks good to me.
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
> A little bit late, I just picked this patch, but I can amend the commit to
> add your R-b, thanks!
>

No worries, Learned about this new convention from your patch and links, thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

