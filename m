Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466A351C2F
	for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511250; cv=none; b=OUVHFn9+/SwA8kyndribKHxEf2ONqaBt7m9InhBOmIhXycL6qlb5A6IUY/GRxO+vRBY+/QbSdSQcOxvtfXho1U0xl6LhbtSrx0a47KEvEXXqBkH7KsUT7QDBWehrdh9TitoWF5OpNSlOos6ZcrAEgxLUK7bWdJeCvcTt6pHrcS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511250; c=relaxed/simple;
	bh=O0eARiw1G6RmntTPXYAxLsbyESCE+Ern2D5WQkar8Lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GAAHpZMN9F/roLarmX6GgEAAJvwcv71wIAmBhlMt4CFioO991LPAiHyd23fmG25O5TvS2GNjh3RCg2BO0Y3W9TdaeE70lWBSwoMmm26W1GyaBA6iRD1bvbzlC3XsiFjoulrKWCXPmNJMhfMg9XpD9gR6h2442cnN9IlNrKJAEIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bR6jeV/U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bR6jeV/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774511248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jsqEMVBo618iREZvKPp9ckkBj0Js5bgevHsPaD2c9U=;
	b=bR6jeV/U7lN+lu9GnqD+zvtxQLb/qK0sBikEMF3JIPxQn5pv4n+sQWoNv7nX2JWjlRQjdm
	+jCi6AkvxVWvpcIMYEKXRE5C/DUbZeBOP1klggS3NaCDoMZhITDO/Qdxpduc29BvSNRHhR
	Q0kuRtM4piaemQmwOBpRRXdhfw8NE5A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-AOIMLRt8NLKlcTE2mx6ejg-1; Thu, 26 Mar 2026 03:47:25 -0400
X-MC-Unique: AOIMLRt8NLKlcTE2mx6ejg-1
X-Mimecast-MFC-AGG-ID: AOIMLRt8NLKlcTE2mx6ejg_1774511245
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43b3e0a73f8so476654f8f.3
        for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 00:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511245; x=1775116045;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jsqEMVBo618iREZvKPp9ckkBj0Js5bgevHsPaD2c9U=;
        b=g0hV9dioRsnoEpgMsQ54irtdFBu+9eXPzPA4P0LRPZzQkNzU9ofO3YO/GlIG8ixRY0
         W1BdL9FlbZ2U+KO4fQ0MV1uzHcfYpEToKdJ+ndELm4QAnr/CNDrCkxOsVWj4wst1MnHd
         n0IDoAAa5vsH/6OqZCh5TOYW5LHzFRCojJY0EXezcTDt6XTnSArBPtgRR2E4gfTgurT+
         9gzIPIGJfiRYLQFLF8Isqh5cQm8G1axbcOg56l3ycSxe3h1geZUlXCdhsXuwdwGGtom+
         iG+/uBcCp1knZHxrM8EJhdek0i1X0PHcxk6KCIMHvJET8b9Uwq3fo64Hpe9aFY9qgGo7
         hRLw==
X-Forwarded-Encrypted: i=1; AJvYcCUdm8ORSEcPvU+X4gHdky5sf4IX9uKSnYrZkqaTKCGYmvt8vvhIFjAQLMVFqrmMwVAkLMViU39Trw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrjC+7hxVIREz167m2IRHtYMyvdtGjcfBTiT4LDVK5hJqBT9k+
	6WlQLGsjwf/Cme0zb+oedWz/lImAaeUYfUVFQ5vNPJj9Y7yZOsJ56SIQKy0rW6XUTNItSBNEHHf
	VmEaY94iZXuN1x8yovn7uB1Tih2Vai1iN4lnsraMWR/gSWSWh0HDRvnJFbdy/
X-Gm-Gg: ATEYQzwVv6ei8RXrKME4OAYET88DT2+USHLFribmsNXmkDKBxvoBVJLcbWOi+UpxwCP
	cG8vY+jfS7lFeAsVlWGnkfifuHfAyszorRUzsFXGgs/cjjoPZYJLYJQbOHW8GW9aZ9IOVxrLLrN
	zYYoYGUR7bb1lvVeTFeik+qveKOV77e9szCa/zJWc0cuL2im084G3+M/iCZTc/WCCzSIKkVLHDI
	eriXEjIpjzxWDglSdfTNjkmjHnR3YgoNd//V43RGD1KiaQDi0uSOHmp4jhDeLr6L1lwBks0utdK
	R0Rgu/lbiwcW4bqwSvZlMyxqdSr+WD0cgk0iqL/Mm7vw+7/FkRcooIs+R+4kU+KD8Nx2+nknjFN
	feEPU6LFGP2nbNlL+bW3SW8vjR7E4/4VhHgnyxjxhNyrGwNM1FFicl81b8vsblGvAUOvzztxjiJ
	j+XPpW
X-Received: by 2002:a05:6000:4312:b0:43b:54c9:85f4 with SMTP id ffacd0b85a97d-43b88a8ee05mr9887126f8f.39.1774511244659;
        Thu, 26 Mar 2026 00:47:24 -0700 (PDT)
X-Received: by 2002:a05:6000:4312:b0:43b:54c9:85f4 with SMTP id ffacd0b85a97d-43b88a8ee05mr9887076f8f.39.1774511244195;
        Thu, 26 Mar 2026 00:47:24 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e722dsm5509708f8f.35.2026.03.26.00.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 00:47:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
In-Reply-To: <20260325-thinning-apricot-c156914803d6@spud>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
 <87zf3w6o6q.fsf@ocarina.mail-host-address-is-not-set>
 <20260325-thinning-apricot-c156914803d6@spud>
Date: Thu, 26 Mar 2026 08:47:22 +0100
Message-ID: <87wlyz6nhx.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3rU6aWiZSwX2qdKUOvctQAJ_tw2ONAdlsGVzWwqsN9E_1774511245
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Conor Dooley <conor@kernel.org> writes:

Hello Conor,

> On Wed, Mar 25, 2026 at 02:20:13PM +0100, Javier Martinez Canillas wrote:
>> Yixun Lan <dlan@kernel.org> writes:
>> 
>> > Add a compatible string for the I2C controller found in SpacemiT K3 SoC
>> > which use same I2C IP as K1, so make it fallback to K1 compatible.
>> >
>> 
>> If is the same IP as K1, shouldn't the "spacemit,k1-i2c" compatible be
>> used in the k3.dtsi instead? My understanding is that this is the meaning
>> of compatible, and there's no need to add another compatible string for k3.
>
> Your understanding is incorrect! What Yixun has done here is what we
> want people to do, because even if the IP is the same there can be
> differences due to integration that are problematic. Having a device
> specific compatible allows us to handle these kinds of problems if they
> crop up in the future.

Thanks for the clarification! It seems the convention changed over the
years then.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

