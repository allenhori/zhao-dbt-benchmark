select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v5 / 3.0, 4) as v1,
    case when p.v5 > p.v6 then p.v5 else p.v6 end as v2,
    p.v4 + 13 as v3,
    p.v4 * 7 as v4,
    p.v6 + 13 as v5,
    round(p.v5 / 13.0, 4) as v6,
    round(p.v6 / 5.0, 4) as v7
from {{ ref('int_ev_0096') }} as p
