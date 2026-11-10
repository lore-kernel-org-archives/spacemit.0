Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314800;
	b=15oxn9JcxMKdOpcP+7M/3VO3jmO8rKhTxHTfDtvxwr35b96sJXXjIFBFIPvPm2L+m0/S
	 Ol2jSJvkGOC2HfObezouKaNa1xL6LXH5FU4m6dMAwyOqUCOT98SOMU/fUuTgiQ8GvySXH
	 H5kffgkNuWul6bkhUKsjEDAh0FYJwCerUm7q57neFTGlJNEJrZCvfBOkSvVu/yvJBIxEi
	 eY2VgpxhVAB2JclyQObqjsxkCGaE9m7++2IjmYI9oe7si38UcYtshi/0TFrqHmvGlTmAw
	 WQWOhXSuAOD9fbl08hPIRzJk6PAH8SJWdfGzo4/iPZZ7lXqZBitCOTOWqczVh8t+FvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
	b=Rl7bvxPxi+TpZIF7QJYlEttZ1lfNwJ11n49deHKtplCN0ri3jlVBAtHI7X5YHGSRQYhw
	 XmZwWaG/Fq7i0tyGOdZ5gKqYUYBlFwbOk9GmQLP3i3of1m9mFTFgtG37OzTGKohZ5MpY9
	 3Lh9ZvpbGc/3ShKqBKZUZ5sCKNlYsErALBJ5nfU9mk0IuLfM1S14hVxg8bsXrF6gK6W44
	 AUmudxia/J6DTEHFMdkaNd+DMustqicIwzSK6qQBKwB33VDqz4n1W2PLp2CVfcRJpvhnu
	 JDmcEDrFreJG4CxZkzi9Z36Em7ZK5Ta0bu8wsS6ivdejTR2n9Wdfk8DVUAlDv2Ucyzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TrICYwcA;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B300606A33C
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 12:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B300606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TrICYwcA
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1C0E740267
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794314791;
	bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=TrICYwcAYTtrym8vDSAPT2wgzAF6FWMVQILkGZ048uOL9bJbddoTVrQ+s2aIVhcwv
	 /h9YG7JSJFBRaNN0DohhY/xSM8GMZ+4ZwvUI0jeuz027MjN4YhVbTyteeQBWTtNxlT
	 PJpMAiWU2YLtuQp48TDReaMZS9XTSAMG8L316JWIZ1xxJvkMjEark3j8Zj9vIsM5ps
	 EVfA7daemXnXcacplbEpxgZl0i+8lJ8p3RpFo024DSeM0rep3gsHuVc35cpqE6l467
	 Dm3yasT5zTR8g+iva6PTrUi3L/rrVuxq8vuT9PfsVnXnlXsksyosjnEPLg18UUDQIZ
	 KhzKLiHqZ6uuLSS0aHO+908AYOIOX4ae/fRS9qGw1RgQLoQqlnagxwVJePiVbtf+Ti
	 /ujEoxzpXtCEIcJzPuyi9ReEvpSogfu9PViRDmCAVrW6ICd22KOgw87mOWQYMQhVf+
	 64zB5k78FQbmaHlrHkzdhkDLxTcmcb7B/7Dpm0zRYXe4s413Z2v2KwGPm7vKmuGk56
	 7UsGcDmRW0j/PxxS2A9V5rnXK/aJPuQhmRPb2egmrKw5eAt19nYA04nfieHyu+IRS8
	 XpI+aYVPDXDqdWlXVwib9zs8A/jD8hbF3QiQBT4vvl29aQTFaTD8zPkPFqabWCE4Kc
	 JRudUlc/u6TkibyO6nuWY578=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49febef74e3so13638915e9.0
        for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 04:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314790; x=1794919590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
        b=WWFaiIKuLiAw6GBiPLVfbtJKjjUI4GZedMGzwUDBMd+nLx1M+FfmMEa2kqKRWVwFzY
         8OAfhd/0lX2U8ZbUui14EktAeXl38x+kT0cohTSuoXfigZ+f5U7dDvTL1eNIP4dBPlFI
         f3HS/jQmMSgfuoacgGRDsFJ2Ehp8fa9iaaRezR2kfdKBk7ztNjGcSySVkaT1E3sX5dGi
         MYaK9u04EwiT8Kn0FpnSsCnj2YNdz8u21bpDyGb7kP3D+p2BYjWmLi41KfXXpo8KIqFT
         BrxfRV3A6G1zFB3GIitO1L4T8rh+fyJdT3iLB7LSLrd8n+J4UGDN3NVsF53BcsYDOq+n
         lx7g==
X-Forwarded-Encrypted: i=1; AL+hErGOqbZs08ocxH415sb/riS23f0HoYR9cpSnR/fvvmrpMtzm9QxVbojUUOrG3wp5WW5WRSK4f43nPw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/+by92zr9FUo2mVTjnP3rhWvh6a0Xa+/bmIzlgnmcnPQwCaYj+
	Itb7DH8E2ZCRIr+huaECMijKQeJLU9sp/62shLBTXJf6k2THX1xYO3qSKyKkR7hPicLD/uLcmf7
	cFTXK8ATzjL6/FZq+2Z7u/J9WXym6ooh3fI5JXxQ/Gv+Qt7S2RKfH9AXuTk0s0lNsY59PfiQtkz
	fa
X-Gm-Gg: AYBFou2wst8t5J9eSGgm26oVJnAb7vYzbYDf+mJ0TazHyEVrE4TqNVblt0LixWYHCD4
	9mJzd82irGo6tA5BtJH00bggqw6Bhy9U+3d/cdXQvIo3F0Qo4IYIUD8z+805HzFoVjyabSxxOI1
	8wpM3zJwcslvq684jhIO1Re3hSlFgj1ZZ/q0W0HwiKtkBvhddnEaFKqqaKyBvBF//c4PHTPsCGM
	J/lW90ntQ9IVYIOlDDJuWQ3Cm74GtdybX6A9NzwfmWxFoJl+p44svdJSRXXtm2saRmVnoVTulON
	cWtHSV4fK6QWmw4M45SO1miybTWtFGwmHNvjI79u1FlbRZU6EjNtf2c4VvCsx0NIZnesqZ8BeZa
	Jq/oKc8SduU9Bi53q+OeZK8DDQhkN+8uH9OJny/c5Otd2T4BoSKPrXnZPJRmy709LONWplXpsoY
	KPBA==
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr41310505e9.8.1794314790552;
        Tue, 10 Nov 2026 04:46:30 -0800 (PST)
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr41310155e9.8.1794314790230;
        Tue, 10 Nov 2026 04:46:30 -0800 (PST)
Received: from ?IPV6:2001:67c:1560:8007::aac:cab2? ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm71022925e9.9.2026.11.10.04.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:46:29 -0800 (PST)
Message-ID: <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
Date: Tue, 10 Nov 2026 13:46:28 +0100
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Troy,

On 05/11/2026 09:29, Troy Mitchell wrote:
> +	model = "SpacemiT K3 CoM260 IFX TQ";
> +	compatible = "spacemit,k3-com260-ifx-tq", "spacemit,k3-com260", "spacemit,k3";
> +

On the CSB1-N10SPK3 server from Firefly, using 10 K3 nodes, reading the 
TLV EEPROM of a node gives: "TLV 0x21 (Product Name): k3_com260_tq".

The latest EDK2 from SpacemiT derives the compatible from the TLV EEPROM 
name, so EDK2 will report "spacemit, k3-com260-tq" as compatible. This 
is by reading the EEPROM that was factory-flashed, so it is not 
something easily fixed by a firmware update.

My understanding is that the nodes from CSB1-N10SPK3, the "K3 CoM260 TQ" 
and the "K3 CoM260 IFX TQ" are all the same: a "K3 CoM260" module on a 
"TQ" or "IFX TQ" carrier board.

Is there two different carrier boards name "TQ" and "IFX TQ"? Or is it 
just the same thing, called differently in this patch and in the EEPROM?

I've seen EDK2 referencing both configurations ("TQ" and "IFX TQ").

I'm not sure how devices out there are referencing themselves. But if it 
is in fact one device and the EEPROM calls it "k3-com260-tq", this patch 
will not work for device-tree matching.

What do you think? Can you clarify the situation?

Many thanks,

Sarah

