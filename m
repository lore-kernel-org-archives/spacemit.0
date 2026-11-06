Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982355;
	b=JkEhgsFQhg+YNMrYSWeXGjc494Yc7ETzzKuAKbOQcDGMtwQCsPI3vl/5me0JGpRomAW6
	 fAyJ2ULjf7R10IutNeJdKeQ1wvRSQT9PkgOximCoaq+HkTmHsywBTB/jQ3aZkGuU25cvn
	 l3SngASRDqNBthkR6B81lOw9PMmJoh1rwrtJ5oNpR2E7iZeivoUM6Q5+gkifxKaPQf7v/
	 oF5Jp6qgoKjAouknjUzVjjyAI4LUY6YN59FtjTSKyCDV1R85eI00GiqOg3RmcE1LNrBsv
	 xiYi+DhoCj1+GVFdVfdCJ4zCqdHgc7HgpT2DztM8vubBAq5OHddtzlt7qoPgBe+qyZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
	b=z5czfNc/XccrNlbVJ/H8UGWio1/r7uhinPQBlsd9ds1VFWCfMzQP8zRSqwm8oRqZ0aCI
	 nGPZE+lWbA1xqWuGdXf4rBrspmmo2lW9lGdHqODlgLAvrClC2dLWwPo0rmq97/NSXINq8
	 O87kDEGg+fW/Zgq9T1eK0XpoOvkcw6HNHMM+3OBFYxdRFSRtRfboKuIGb2fBh5SjBVGsX
	 kmrys34TdE0JBzWV6FyEpY+zLjM7U0A14EUs/1Zad5dD9CBUF/f+3j6tH07NpC+rXzWrt
	 RdwdNEM/BqBVazX4xWUQdEZqR7wYsiy/i4QdCEmndiFBCkKNn/Hgw0ylD/66YVKkaAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kd5p9nZS;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476D606A329
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 16:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B476D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kd5p9nZS
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0CDD93FE41
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793982352;
	bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=kd5p9nZS6m9QXbQsCgnbeR3HTP9si0Xc3gxnPyaFx3ySWcliQs6Fjiy8C0achSLqa
	 /U6XYYnlIzrRXBkvKUWLMlTqJ4MYl9MK89jKcoJqhwW3SkW6y5DzSSng4RRK3DyCjS
	 +qyYRDy0O8jZC6lhhEObm3bnFBNOVHLCPIiZlvlShvNZdb0PljY60dfgRqWfAX8pN2
	 kOXbB5cSkZF3/CrT/emgPZHmPUH2V4z1nKHxNyvy3NVx+Dn9uZJVTjX2OhV+B/P02U
	 WSDHWtHhEN2jOt7XnI8sRzKW9ZonuzBZxeFr0PRqAr5b2W1BdJ2e6dSczSoU9QaraT
	 BtG6ZRI/o2o0QiFe8hA3QrhN/hFmt0rYJ0NV6yCg6O3UtD9icr1+dixDWaHrEP1i/H
	 Q61xtgm4biH4cpKJIG20ezn2N3Uj5OeTa4qL/yDuPbU+6A/NwGzoOuT4zw5FJmygEC
	 7+3juWsSn0IQ0yelMFLAhteGX7lkJqs3PaVi1VnYh6vsoY7nimnx/puuD8mAfejKPw
	 De5UW6ryHuZRVVyMDmNM8JVnu3AInjDQK76yhxp+eZGuB24BOhD9Vc1+bSguuJuu5J
	 lW9998owwbfmGrdbcnTcPyOUWyFhfuJuFkLhHPoV8Fuau9wdT2UCdE+HtTrfyhRJOX
	 UhevWA6OviFhwEOZkQW5cVkM=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso5124375e9.1
        for <spacemit@lists.linux.dev>; Fri, 06 Nov 2026 08:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982351; x=1794587151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
        b=fMAh8nmoiWJmsD4E9pYRNVFJu5EoEsDgnTCuHoiC3cw7Po0cBU1Rnadhzmqsa2PjE+
         8JnL36wRtESc0HvQlN+FY2QiuV7zzEtOiag1/dZyKUyAaPRbC4Q/nHPoIqq2jXzj1q1b
         VS8SgInChLxiL+AoehoCpOA3NJutkTFzRbT3o9oaTLXGkQzy7Jg5c3pFN51EZmlXtiF0
         nfPItJvgdJtsrzsZ7+DIY8xSfWQKzX8JSHUV+P52tEQ3+GG82S47UNXTZT09jTnlkUIx
         akhY+6+eQiW5vBMzILm/HKqjawZ255wn0qkWyHR8kg4NWpRo8pGhjdmTl2lOnAymuzrv
         ihTQ==
X-Forwarded-Encrypted: i=1; AKwUvBycaxU4s0JPpu9PTA1+Vo7rKB0t/zFMUFlXdbJt9fB9dE6Tpd19AkNDqmFQrr+6/i317n2zDSLCjQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/q+ElKtPMqaB0rpWfwE459I+7E0/RArE62iuZlGNYCC+eUMHye
	EH+obsgWpqx/6G4/L/w6G7J35GOONs4zWiL4sVCe2miu8VxIwQTtfOehtEI48xaZzhI86BKeq+N
	TIDY6BHIt7gxxnW+SujONLhFtPSD4EoGttgMV5W98lM04v9fooC6GfPozYvmOMVFAOwL0+8pmv2
	QD
X-Gm-Gg: AYBFou23Qa5yef4IgLH8FOPxmOBJ0/yr5OM5gqZgpBz2tLgZl7dKlIDklmu2HtnlxUr
	p/hJKIpKuJk5CWBOEMRmB5kwEB52+oEtzXT8paJgBH3L9s+ith8jJdTOUa4aBQA/1q3gOlwhQG4
	c6+7BsJlJEa3MDTh0g9GxZVsfgzeY4MzgyT/4EAcwyXmCxOa8yekMbMBuei31yU+CNDRVNfJVPk
	aHp04RoedWRSJ+YT+HY4aMVdmKl0mMvuqC+L014mn7k6x/+O5+EhQhTwza0FS0I14Yxi7BoF6kB
	7VcocuJAJ1lMsTERkoaDkKsC8WeF9dV65IwKHkzs8mL2CUdn4erndCbTgPfOjQSq5FqCV7crcNt
	YZIv7hI88ZDZ24yMtmmAadVRcEa5Ixs15cu8jaeQchjcQ0w9CnBnXEaHpfIzAuD3jTq8l+ZfcxQ
	BM
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4b6dc6df61amr54605805e9.4.1793982351640;
        Fri, 06 Nov 2026 08:25:51 -0800 (PST)
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4b6dc6df61amr54605455e9.4.1793982351340;
        Fri, 06 Nov 2026 08:25:51 -0800 (PST)
Received: from ?IPV6:2001:67c:1560:8007::aac:cab2? ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm82686435e9.15.2026.11.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 08:25:50 -0800 (PST)
Message-ID: <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
Date: Fri, 6 Nov 2026 17:25:48 +0100
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
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Troy,

 > +			uboot@210000 {
 > +				reg = <0x210000 0x5f0000>;
 > +			};

This partition ends at 0x800000. On the CoM260 with EDK2, 0x700000 to
0x7c0000 holds the variable store (NVRAM and FTW), so reflashing this
partition from Linux would erase it.

I think we could split it like this:

    uboot@210000 {
       reg = <0x210000 0x4f0000>;
    };

    var@700000 {
       reg = <0x700000 0xc0000>;
       read-only;
    };

What do you think?

The Pico-ITX node also uses 0x5f0000, but I think it should be modified 
to split out the var part too if it makes sense here.

The Pico-ITX flash node also has vcc-supply = <&aldo2>.
Shouldn't this be present here as well?

The rest of the patch LGTM and matches what we have already tested in 
the Ubuntu kernel.

Thanks,
Sarah
