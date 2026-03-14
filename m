Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B48B282F0A
	for <spacemit@lists.linux.dev>; Sat, 14 Mar 2026 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773476462; cv=pass; b=mrM8kJqwP60QVAR9fSc5fH/IotapK/CwSGfbMaw7W0n2qgIdX2oUePFL8oN2bOXuAHzea7Yb+50YrHYONNXxqD/BjzA4oLDGpGJALPpsU7rGFNAnhd0eO2VFhpiOqhQhhN6ACceCjXGpYT+mVelSDYQj101BniQaIZd5uVMPwvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773476462; c=relaxed/simple;
	bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQA9AXp12QgpmrUjBw732/p11cuKfoLYs0K/tx46kB+cQPQlcvG9hhdmQqQqeN3qKvQwl3FJ8OYVZnsgwgisHdaFmKJAQTrZixCOGWaOXB33t8hV/ebSlLgqmTmjVVchSTlsqVEB0mF+nO0SVVW8+ykUny7eYucx2UW+e4owcvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SERKNl/5; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SERKNl/5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b940a00415cso381088566b.1
        for <spacemit@lists.linux.dev>; Sat, 14 Mar 2026 01:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773476459; cv=none;
        d=google.com; s=arc-20240605;
        b=L/CPzwBqtolcCrh/Q0pZggohvABiCJJI8WJQZhhOVE3VBgEVgbF6MiOHLjLPNyaMGj
         vgXvrpOwys5QfPaTw8nnMsOJG8E+Gk8NonrTsF1VIyNbxrTo/sqWIEe6MrI3evK3iHhR
         EbjlMZFan7qG0MyvPyIrwx63Bj7OE/WlzixcooEPgJu5TvoQGgPLLhS4KGHflQ+/VdtA
         fxOXE+VlOVytTU1jMKkn90B+N1+Mte+m4kWpWX1ltVMN8m0oytTc0jQa2wDQZO+c8ciS
         ks3GyhBZxVN7aWPVeIva5t2xxUOYwLvb9KvBGo4IW0+WJjWObjjxFt+lR3weI+PFDeRc
         6tFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
        fh=NU/byIeYCvYTW5/znNb2bboqKYwfVQNJv/e83r5Ip6U=;
        b=hBYCwAYUl9ySbkjqJb0Khr8XxJe9xrlDLs84/px7g1AzG3QoSNxwoim2dgqcLQ2tU2
         xQHj9UradnCu2dFWexLzrauvlPS0RfJheLcyGo3ADZHIMMPHw4pifUX6+2M7uG1H5nEQ
         dt+qJ4rssf1AVv+aGId7Q33s/TigVCsuCXMHe0fPt8yQne9FJLHKrp2CHvvcIJkYgoTF
         BuECX5A7jEdlF7QCJteFu4NWmQ0GgDvdOsMPeHpA6oN3fVpUD3jFDoDBevOBErCLn/Jh
         TA6QuWYbg8vjGxOstfZRRqKiIAdEnl+l56l2OHXpIsadMDKbzF7Ew4+gtbehh+Tll5Hz
         r5Kg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773476459; x=1774081259; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
        b=SERKNl/54zyEaFlrbI550zbW/2wHZvAvnwYYKL+v6HJaMet7Wq1F4n8d+ijurM7aWf
         xozHO6k4pH4NGMAt3PfAbWXL0nhpcQLOGF5NYEbrWDNh24Y2kc65ooZGmyl+NircKut2
         UPGDa8jBAja2xN22izrInIFInww6yHh6gIAqxhqh0CIrFoeUgm5Lzf6Yx24w5Sn8XT7k
         edfIUmrQW5RyfBgu7NMWor0Drw/fvfEvssrSuIOcCzCPU7NaV5jTKZ+1DsnPCtICh611
         3wcpSDCIpLGpMM2q5ooBIpOFmV2U9/qzUEOCk0CTvIuw+NttV5WjrKYvCRxwOqVcDyhd
         dhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773476459; x=1774081259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
        b=jrXFEVZBvkJAmgamoCj2uJA10BAKlqpFL0wkHcygPliapW6c1KAl+2zJD36rsBNKr1
         Jl/ly14ZX+Ek/nb6PCjGUCoucTlx6l+XUrPAZv316pSqGFoV5FbeznQFYPG4MciT1n+E
         QuuxxjtAXXHS5g6FuB8NUaeuE9k5wmglg2Kl7I39UWxL+P+B28OKgQEZbBZ+RiZww5dG
         iU83mxg6jdq5qYQdO5ZIOJ6phlQ5swqdmRbQbsy+V1gx5csS1I9WuqrdI/f6pwwL9COZ
         VfGo9KpLi/ylljryMOd7OjJJzWiLi4y5HMYHha0D72phONi0g8BmW+d2zV1PZh2JhMN0
         wWYA==
X-Forwarded-Encrypted: i=1; AJvYcCUek5OwZh177kiozZQG7Ip7HsJvn8GGsBKiBfqBp3KlSOwk39odIzrb26ZI2W3DANlyujHnYWsXtA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yznfml1DmXp67w1kF5P3IPZgtAyH0kMRalI3yEor1wM+Z4v67WE
	XkruvUFCi7+SvkHQ5fFZKGOfgeBPg8N/ESFYOtajGJIa/B2C+rhOUZs59pW/y9iAxZf01HWofSJ
	4J0ESstCHMdqNr7F+JgA4cW+S9vmug8k=
X-Gm-Gg: ATEYQzx7xmKjOuAGN8fvcYYS8ay9pyWZmbG9h/jAFUzR83R2p4ePV3qJZnyZVe04HUE
	piC5noY7sqTXQAuUPQQE1O3fmmWpdR6k6j6oEcGjr6Le0Jr4cRH8LfVL4fYQozZ39kmAY3KMqiW
	gIkT/8m/jUhvbN1WEyl1fwhLIRrUX2YQFDyn6rfTnjem5Ji/k85jiwSTehBa7P/npj1wHpnCsrP
	SZ8YRTn9go+a4eSoyaNOJzKlHzFFvxX5C747KsbmJrm2lgd0kTCxCZHXBJmF6/dplcSilv2TC5y
	25LrRnEm99vIxKDi
X-Received: by 2002:a17:907:c305:b0:b96:df8c:42cb with SMTP id
 a640c23a62f3a-b97652124b2mr305792966b.46.1773476458945; Sat, 14 Mar 2026
 01:20:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 14 Mar 2026 13:50:40 +0530
X-Gm-Features: AaiRm50vBOSwj4szvgoweRvqZZno3gW1jvqc0W3UsBDtZwZjhBCmdc4MEYz21_c
Message-ID: <CANAwSgQj62=2VFxpUKqXiyNfP2vpPBnB-p_k4_83L0mMQ5oOPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit-k1: Add set_config callback support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Junhui,

On Thu, 12 Mar 2026 at 14:14, Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>
> Assign gpiochip_generic_config() to the set_config() callback to support
> pin configuration through the GPIO subsystem. This allows users to
> configure GPIO pin attributes like pull-up/down when specifying a GPIO
> line in the Device Tree.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
