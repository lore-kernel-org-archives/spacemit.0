Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540093A759D
	for <spacemit@lists.linux.dev>; Tue,  2 Jun 2026 21:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780436584; cv=pass; b=nyAIhS8bXOGt2yA/7F9G75kvs+7hcpQkFjarT6n7ci/PnptSyxmBWmp8L1dzbkucx4JVe4iR4F7Glaprcn9dZrAiFA9P+6e4sQl2xpnyFjJNwb87Z1msUUUQI8en1O3o2KAbWfdRjxQZ7nppswdqILwJSDIFsS3wfDSuZhTpm1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780436584; c=relaxed/simple;
	bh=t4tKC8tTqtar0OSd/aKDG59lS9LLkPQiuXg2Vsq3cJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgBVed7/GAUhqmE3VrcT1q9tfAQLpuUzf6BodVzcbCH/8nsEMbUM+cobGKbfy7rxppOL7uWmQW5ZFPq7WZcGwtD0dPyBEhxecosc6TH6/4LhXT2RXoUK4QqJ+YiAheLPyYcoSAqJbTuHKJ0uqDBjw4pdpdw09UjmxK/MyOxU9x0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyyj5hOD; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyyj5hOD"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e66f966d01so4073222a34.3
        for <spacemit@lists.linux.dev>; Tue, 02 Jun 2026 14:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780436582; cv=none;
        d=google.com; s=arc-20240605;
        b=C9+SfM3SxW+q8X0ul9fvXPUnA/sVTV3u9j1QcJyvy/JhGDRKCyjpDVuoYdMNPrTjW4
         EAon+xlKz+iVUpoLIpDQCQkfQnqQgpgGAs/joKETaCq45qi8ZFSnRryp2Cn3+Q0oehSR
         02Nq4kzxYWI06uVRqH+3VyXBJes0D1t80oHd8kzuLNCDXNesj126uy8KRm9pkpkBq0zp
         utkackRujEZQFS8MM3qy4K+wLooV1tXl0u7xs87kBXz6IzmdZHQ3igL+D/MB4TVZX2M+
         sPxcczs1CZYG8oawwKMCowUo6ZHaHtpiMkZpTH5vqFp5lc9bLyxgrYruXcSRn8/42bij
         gpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t4tKC8tTqtar0OSd/aKDG59lS9LLkPQiuXg2Vsq3cJY=;
        fh=6e1Nwx45sUg2Qm01AkPgrjg7/AK6uL/C1W3pPbBeZRE=;
        b=j5EW0wy/feTsnrkiEc0qZmlYiFtl4FA7u2fZN1TjkwbQqURTl1n3Z0tolj1ph2YLez
         w07Us0ctqvlclGx0lxx7wln2SIxd6PGed7vG1AXYcceZJdBFVlfMult+dkgYagKXvA0a
         /Y2wPxv5fPq1qvHT1w6Kz/jaR6mqdd0tsKQPMmuWNmW9vZ/SICijmLlGAao5eNhS9OwC
         X7CNt5MSwR2aKi2iXhhbmJJDfwRFEy8TWt2atraOO22dOa4Ek14vSe9gPJGTGWc3FlFl
         DTXxyzXsmfOisEh+oaF5Q4ddlM1P82iX/3phNwxqzerZ3dVtyCM05i6cFSyQbWyY6zHz
         uWVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780436582; x=1781041382; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t4tKC8tTqtar0OSd/aKDG59lS9LLkPQiuXg2Vsq3cJY=;
        b=fyyj5hOD33j41S6nogTZPfatp+kMvZWS9hdEHAEGYdzjP1qBw66jVkZ4MLnVv7COjs
         expzC/SN7VGgJA/Rp2I26OmiLfEhr6Qcx9xKc+HxtnNAfBsBvnrK9r2Ko3cPn3saJ+G2
         tKDuND7+su773bAIWmku0R9pMk3/wLiqBHOj1Y/AB9Gc130e4z0zWadCdHeF8Bym78oJ
         Uz4GZbcZ+Un1uADZkSxY5RqcaZawDXzihRYVnjwCTC+f8Vph5QYU8yTt+b8Nf3YxXTZX
         0gx1o/hpfN6eotzad9kznAlfXvfT99Bo+yRbSw6l966MMNelrmtN+A8VygBLQMwlHsJj
         PXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780436582; x=1781041382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4tKC8tTqtar0OSd/aKDG59lS9LLkPQiuXg2Vsq3cJY=;
        b=RxJJ5c18EOeUXbWISe3DHea/g+jNwxxJm1gBChAiXvs20OyFEhvlk8sVzod9RWRYui
         TcL+MhoKr9DU8nROVuiCyL+ZlHg0J+45mbhHviQAnBRZJL4Mdfrh9zWnhsXvIYUt980D
         kaYLOZtRop6b52jSGt7fvzVmS+/9iLPr4uT3OWzQZI/ZL4Z4RXvQbNgDjREMcUf6s7Xp
         cd3osrOgZz77xMdSaIPSjc9z///8KhgC/+hT+wYsHzyPD519/nUvNdeDHU7fRiWjcbYR
         BkiX0fBaAJUqhPlAI3Ts1TOWw4FsC2oVAn1d780awCONzoAcYYkgWjHFYs9RHlNwzUEp
         XKTg==
X-Forwarded-Encrypted: i=1; AFNElJ/JfckvXfwqBF+GupA5fLaBpLW3UHcdauRa7KJ07ictC3fYKbVQFZwIMxZR3Wwc5i4iGD5wYy4Sgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzL16cNVbxIH+/cDxQaiLFRGlrZlkPpKrZyNEoRt/8KNx9IB7U9
	zK5li1hk24q6bJg9Xpn1RjkzXS3i/o2JNSnjhDE23pHcGYqe4wAhVmm/GH+NQjfd6IFqnJXkEoJ
	rEq4tYG24jXZj7iCXUTn3vt3O7Z6ZYfA=
X-Gm-Gg: Acq92OHjuUsDdlelRyXclGxR+wTw0tn1ImaWaYAdI8MXIhz5DXu5F4/tWXqkgk5Pvl+
	E+/BnJyz/Sk3H29rYk12gdAX7hnxV1j9TF3F8rZa/SpZfatNmzd2dt7q+QSWnl281oAD5aQgxjt
	GR7uUKqhO0a1Sn0YDyMBwK1qen/sPdF8OXoXXvJ3Tn4/VhH8wl/MaxKmmcQubaUeA6V0x+DDZc/
	L4hzykbN4Toe30QPw34qzlhURwPvH1UGbEpU6fYPj7QGjl9QMy1nat9MoiQcWmEfonWdYy+1ctQ
	8LMna7yqjLnn/2i3SDbZBQw=
X-Received: by 2002:a05:6820:2082:b0:69d:a224:6ee7 with SMTP id
 006d021491bc7-69e480f3a64mr536219eaf.54.1780436582388; Tue, 02 Jun 2026
 14:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>
 <20260602061734-GKD3815935@kernel.org>
In-Reply-To: <20260602061734-GKD3815935@kernel.org>
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 3 Jun 2026 05:42:51 +0800
X-Gm-Features: AVHnY4LQ6lzq__rT7CAOcTBxcODK3EXVz8CNbmDQAi0qqWOKUZdVQOQ0Up1QUNk
Message-ID: <CA+Ck9FZH=b8yc=d=s3n5k7dO5keZDQBxOJVc+ms4A8e_rVDDNw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add entry for SpacemiT reset controller driver
To: Yixun Lan <dlan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Philipp Zabel <p.zabel@pengutronix.de>, Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Yixun

Thanks for the review.

> entry, the whole point of adding a didicated entry means someone
> willing to put effort in future maintenance, to help review/refactor/fix
> you can emphasis on this, and I just want to make sure we algined on

Right, that's the part I should have made explicit. I do plan to keep
maintaining drivers/reset/spacemit/, K1 and K3 now, K5 and K7 as they
land. I'll keep up with review and fixes, and reword the commit message
to say that.

> done), I'd personally prefer not puting them into commit message, but put
> them below "---" as background introduction if you still want..

Sure, will move that below '---'.

>
> > [1] https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
> for the convention, suggest to use more formal format like
> Link: https://.. [1]
>
> >
> also no blank line above
>

Agree, will do.

> and I'd still sugest to add spacemit mailing list explicitly

I will add that line:
L: spacemit@lists.linux.dev

I'll send v2 with these.

Thank you.
Guodong Xu

>
> --
> Yixun Lan (dlan)
