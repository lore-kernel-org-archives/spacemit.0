Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2F34D91C
	for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769156626; cv=none; b=u3RJPPhIGUkhmmh9ewQsgAZ1lmKZldcdhYzJfCLv++bTrXlOBk1lYc/PYfZeppfvojqo+CdZraQZ3eGHpVz63iE1gyYt9EHnSGIIB2YeI+Jvhw5JlwKHz3NoQsdMFeIcxdwe68gvKuKzG/bFHAnKo+fnpZkHDgdAmLKW+spCJcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769156626; c=relaxed/simple;
	bh=sk3MTCTd7WHqwWe4zDqa/m3KB8fQqAO1HvbuEq5+7vM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DRYnsQZCIkupYoord+lYcxJHZCgseehNqAWg/5NfpCWK6UXRUhFmHX/Y6o2NyH9tOOYAmDYAxzOXV/qmARMDxG/Uh2FAPNrxIIdrMtvc9rHnAQ2x0e7D+wuV6SxSQgnL6/oKNkiR9WLt5xyxyanF35tkVfZWke4nFj42fj2oSjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gAJc21XA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gAJc21XA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769156621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CD+T1KpcisOIdjn7OKGY4SJv7GT2lLztb8OPYUclLjw=;
	b=gAJc21XAeqUpLjWuxbFYLUChHHe9jNpzbyO+guoo0LT2xgdqeC3XS2dl9mZ5aZlj+/uyxD
	VJ2WA+albS7srsQSKTIZ+6ASmUWtTJUxek+GLYkkA4PzGsVQWFW4A7FNRD097FCAURJvJ6
	6fSc7bpnnMg3igtW4I0bXSan8fG9KSc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-O91P92nsMLelreYl8IQDfQ-1; Fri, 23 Jan 2026 03:23:40 -0500
X-MC-Unique: O91P92nsMLelreYl8IQDfQ-1
X-Mimecast-MFC-AGG-ID: O91P92nsMLelreYl8IQDfQ_1769156619
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42fb1c2c403so1445412f8f.3
        for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 00:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769156619; x=1769761419;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CD+T1KpcisOIdjn7OKGY4SJv7GT2lLztb8OPYUclLjw=;
        b=knrVcJZgzBXgWctyne3aIpkLw5BvfhigPFg2CYPeexwQB+eXrIo4Xunp3O383FWbGw
         7aRxdUyhndbo1/oFwalzox/RkSwD1pFqrcvhf8MSCZ2BZwgvGZ9yNIbY5rdZo72Vu+Sj
         v/KYsvKcR48bgIv5Bv7Wqc51MA4SW33zl+yutq7nWi6W05Xd2rQmY6myxkaoT5YvAhSi
         +q7L0aXoOsnL1MbYbZquMZPjAHXZdIntVsnrxg9nS6jEEoR4nSMeOuFfMQY2IBBjHVV9
         Oj4Uycfsxo4fbVIYEqBRXkUYOjuNJzEX88B0/j89S3IdXyCbz7FGf1zUuaqP9Fp20GRL
         pvbA==
X-Forwarded-Encrypted: i=1; AJvYcCX0Ls4Mz1KhaXt/4Cx3VtlTa3ZaJ1CUpgZ7jFMzIj++P7ymghPFsctXdD8kjrkBmas5QcJCpFs0eQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6Yr17Y+lGxC+cgKxN9RYvOFI/6UDkY4+JoYluDCXBRASQVeea
	x7/8WvOtEUWxawepY7U/TjlUFY35ouK9xemzR/Yf8HNWjALOI5DeHFkfDRWN4UtuUrj/rCFlk4h
	7qwUvlbYVjF7ZKW46doqQPLxcS/gWfzgoZYONDJ2N/xAgmJHw7pELjOgA5C2t
X-Gm-Gg: AZuq6aKFTjoN372NGr7n6+DPNM/d4sXkv28BGqt3OdR53ATmPrst1Agm4qSj7yrW32P
	+90p2m960kQcc5c0DH+F08jF9xRzqS9fSOdl/LaoF702bkqR+ME5DXQRqzHbQPiy3GI4e969I6o
	jE3IlHzpIyGQPuBCrwCPHghn7MUcFiLY11MnOBzRLCOtVTDVd6jA1J8cZh52YPE2GRFBrVTGEjw
	8U+Vz1VA4oUCNYBC1dKqPBMaDdSWzxX3myl1l8wXh6jl7KKnWb2BEO+gxm23BpCBfbgU+2gjys5
	LjRlqRBtACf6kjeEtVTjltbT0uhWBoY45EtecNFTloDY69lxhb4v+olvgprE4auyVIVLMxSJ6yV
	b3Gc+sW+AkdiTho+pH3tJf14buWTAADXKK/HWJJeFA5dDUQ+wGFWlCgExYpad+HIxahVL
X-Received: by 2002:a05:6000:144a:b0:435:9653:e151 with SMTP id ffacd0b85a97d-435b1587d3bmr3552715f8f.3.1769156619033;
        Fri, 23 Jan 2026 00:23:39 -0800 (PST)
X-Received: by 2002:a05:6000:144a:b0:435:9653:e151 with SMTP id ffacd0b85a97d-435b1587d3bmr3552677f8f.3.1769156618637;
        Fri, 23 Jan 2026 00:23:38 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm4756198f8f.17.2026.01.23.00.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 00:23:38 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
In-Reply-To: <20260122101122-GYA63789@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org>
Date: Fri, 23 Jan 2026 09:23:36 +0100
Message-ID: <87qzrgenzr.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fh9UwKcZo4hMCu26t2U9fBufOhvfHI2HgvvOu05VtVs_1769156619
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@gentoo.org> writes:

Hello Yixun and Guodong,

> Hi Guodong,
>
> On 17:43 Thu 22 Jan     , Guodong Xu wrote:
>> This series fixes hardware voltage constraints and enables flexible power
>> tree configurations for the SpacemiT P1 PMIC.
>> 
>> Patch 1, n_voltages is corrected to match hardware register widths, as the
>> previous values prevented regulators from reaching higher operational
>> voltages (e.g., 3.3V on LDOs).
>> 
>> Patch 2-4, hardcoded supply assumptions are replaced with explicit
>> devicetree properties. PMIC supply connections are board-design decisions.
>> Moving this to DT allows supporting varied topologies without driver
>> modifications.
>> 
>> Note: Patch 3 introduces a bisect breakage by transitioning to
>> pin-specific supply names. Probe failures will occur on existing board
>> (K1 Bananapi F3) until Patch 4 updates the corresponding DTS file.
> This patch bring system-wide change that not only affect Bananapi F3..
>
> Please also provide fix for other boards, I think you may not be able
> to test all boards, but make sure the patches are available, so people
> who interested can test, P.S I can help on milkv jupiter board
>

I can also help testing on the milkv jupiter board.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

